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
        
        let reservations: [ReservationModel] = try await webService.apiCall(
            endpoint: "/reservations",
            method: .get,
            responseType: [ReservationModel].self,
            //            token: token
        )
        return reservations
    }
    
    func createReservation(workshopID: UUID) async throws -> ReservationModel {
        
        guard let token = try KeychainManager.read() else {
            throw URLError(.userAuthenticationRequired)
        }
        
        let reservation: ReservationModel = try await webService.apiCall(
            endpoint: "/reservations",
            method: .post,
            responseType: ReservationModel.self,
            token: token
        )
        
        return reservation
    }
}
