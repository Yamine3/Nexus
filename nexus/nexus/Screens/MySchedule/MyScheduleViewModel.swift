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
    
    func loadMySchedule() async {
        isLoading = true
        defer { isLoading = false }
        
        print(" début chargement réservations")
        do {
            reservations = try await reservationService.fetchReservations()
            
            print("nbre de réservations :", reservations.count)
            
            for reservation in reservations {
                print("wk:", reservation.workshop.name, "-", reservation.status.rawValue)
            }
        } catch {
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
    
}
