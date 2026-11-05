//
//  MyScheduleViewModel.swift
//  nexus
//
//  Created by Apprenant 109 on 03/11/2026.
//

import Foundation

@Observable

final class MyScheduleViewModel {
    
    private let reservationService = ReservationService()
    
    var reservations: [ReservationModel] = []
    var isLoading = false
    var errorMessage: String?
    
    func loadMySchedule(authService: AuthService) async {
        isLoading = true
        defer { isLoading = false }
        
        print(" début chargement réservations")
        do {
            let fetchedReservations = try await reservationService.fetchReservations()
            
            reservations = fetchedReservations.filter {
                $0.status == .valid
            }
            print("nbre de réservations :", reservations.count)
            
            for reservation in reservations {
                print("wk:", reservation.workshop.name, "-", reservation.status.rawValue)
            }
        } catch {
            authService.handleError(error)
            errorMessage = "Erreur: \(error.localizedDescription)"
            print("erreur api:", error)
        }
    }
    
    func isWorkshopFull(workshop: WorkshopModel) -> Bool {
        return workshop.remainingPlaces == 0
    }
    
    func reservations(for status: StatusEnum) -> [ReservationModel] {
        return reservations.filter { $0.status == status }
    }
    
    var validWorkshops: [WorkshopModel] {
        return reservations
            .filter { $0.status == .valid }
            .map { $0.workshop }
    }
    
    func cancelReservation(reservationID: UUID, authService: AuthService) async {
        
        do {
            try await reservationService.cancelReservation(
                reservationID: reservationID
            )
            
            reservations.removeAll {
                $0.id == reservationID
            }
            
            print("Reservation removed from schedule")
            
        } catch {
            authService.handleError(error)
            errorMessage = error.localizedDescription
            print("Error cancelling reservation:", error)
        }
    }
}
