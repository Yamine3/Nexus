//
//  MyScheduleService.swift
//  nexus
//
//  Created by Apprenant 109 on 03/11/2026.
//
import Foundation

final class ReservationService {
    private let webService : WebService
    
    init(webService: WebService = WebService()) {
        self.webService = webService
    }
    
    func fetchReservations() async throws -> [ReservationModel] {
        
        guard let token = try KeychainManager.read() else {
            throw URLError(.userAuthenticationRequired)
        }
        
        let reservations: [ReservationModel] = try await webService.apiCall(
            endpoint: "/reservations/me",
            method: .get,
            responseType: [ReservationModel].self,
            token: token
        )
        return reservations
    }
    
//    func createReservation(workshopID: UUID) async throws -> ReservationModel {
//        
//        guard let token = try KeychainManager.read() else {
//            throw URLError(.userAuthenticationRequired)
//        }
//        
//        let reservation: ReservationModel = try await webService.apiCall(
//            endpoint: "/reservations/me",
//            method: .post,
//            responseType: ReservationModel.self,
//            token: token
//        )
//        
//        return reservation
//    }
    func createReservation(workshopID: UUID) async throws -> CreateReservationResponse {

        guard let token = try KeychainManager.read() else {
            throw URLError(.userAuthenticationRequired)
        }

        let dto = CreateReservationDTO(
            workshopID: workshopID
        )

        return try await webService.apiCall(
            endpoint: "/reservations",
            method: .post,
            responseType: CreateReservationResponse.self,
            body: dto,
            token: token
        )
    }
    func cancelReservation(reservationID: UUID) async throws {

        guard let token = try KeychainManager.read() else {
            throw URLError(.userAuthenticationRequired)
        }

        try await webService.apiCallVoid(
            url: "http://127.0.0.1:8080/reservations/\(reservationID.uuidString)",
            method: .delete,
            token: token
        )
    }
    
}
