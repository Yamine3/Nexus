//
//  WorkshopService.swift
//  nexus
//
//  Created by Apprenant 89 on 28/10/2026.
//
import Foundation

final class WorkshopService {
    private let webService : WebService
    
    init(webService: WebService = WebService()) {
        self.webService = webService
    }
    
    func fetchWorkshops() async throws -> [WorkshopModel] {
        
        // récup du JWT depuis le Keychain
        guard let token = try KeychainManager.read() else {
            throw URLError(.userAuthenticationRequired)
        }
        print("JWT récupéré depuis le Keychain")
        
        let workshops: [WorkshopModel] = try await webService.apiCall(
            endpoint: "/workshops",
            method: .get,
            responseType: [WorkshopModel].self,
            token: token
        )
        return workshops
    }
    
    //    func fetchWorkshopDetails(id: UUID) async throws -> WorkshopDetailModel {
    //
    //    }
}
