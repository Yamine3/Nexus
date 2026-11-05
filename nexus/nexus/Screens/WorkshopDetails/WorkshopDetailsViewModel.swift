//
//  WorkshopDetailViewModel.swift
//  nexus
//
//  Created by apprenant92 on 03/11/2026.
//


import Foundation

@MainActor
@Observable
final class WorkshopDetailsViewModel {

    private let reservationService = ReservationService()
    private let workshopService = WorkshopService()

    // Détails de l'atelier
    var workshopDetail: WorkshopDetailModel?

    // États
    var isReserved = false
    var isLoading = false
    var isFetchingDetails = false
    var errorMessage: String?
    var reservationID: UUID?

    // MARK: - Fetch Workshop Details

    func fetchWorkshopDetails(id: UUID, authService: AuthService) async {

        isFetchingDetails = true
        errorMessage = nil
        workshopDetail = nil

        defer {
            isFetchingDetails = false
        }

        do {
            workshopDetail = try await workshopService.fetchWorkshopDetails(
                id: id
            )
        } catch {
            authService.handleError(error)
            errorMessage = error.localizedDescription
            print("Fetch workshop details error:", error)
        }
    }

    // MARK: - Reservation

    func reserveWorkshop(workshopID: UUID, authService: AuthService) async {
        
        print("🔵 Reserve workshop called:", workshopID)

        guard !isLoading && !isReserved else { return }

        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            let reservation = try await reservationService.createReservation(
                workshopID: workshopID
            )

            reservationID = reservation.id
            isReserved = true

            print("Reservation created:", reservation.id)

        } catch {
            authService.handleError(error)
            errorMessage = error.localizedDescription
            print("Reservation error:", error)
        }
    }
    
    func cancelReservation(reservationID: UUID, authService: AuthService) async {

        do {
            try await reservationService.cancelReservation(
                reservationID: reservationID
            )

            isReserved = false
            self.reservationID = nil

            print("Reservation cancelled successfully")

        } catch {
            authService.handleError(error)
            errorMessage = error.localizedDescription
            print("Error cancelling reservation:", error)
        }
    }

    
    func checkReservation(workshopID: UUID, authService: AuthService) async {

        print("🔍 Checking reservation for:", workshopID)

        do {
            let reservations = try await reservationService.fetchReservations()

            print("✅ Reservations fetched:", reservations.count)

            let existingReservation = reservations.first {
                $0.workshop.id == workshopID &&
                $0.status == .valid
            }

            reservationID = existingReservation?.id
            isReserved = existingReservation != nil

            print("Is reserved:", isReserved)

        } catch {
            authService.handleError(error)
            print("❌ Reservation check failed:", error)
            errorMessage = error.localizedDescription
        }
    }


}

