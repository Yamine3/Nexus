//
//  AuthService.swift
//  nexus
//
//  Created by Apprenant 89 on 30/10/2026.
//

import Foundation

@Observable
final class AuthService {

    private let webService: WebService
    
    var isLoggedIn: Bool = false

    init(webService: WebService) {
        self.webService = webService
    }

    func login(
        email: String,
        password: String
    ) async throws {
        // on envoie l'email et le mdp à l'api
        let loginRequest = LoginDTORequest(
            email: email,
            password: password
        )
        //l'api nous répond avec un token si l'auth réussit
        let response = try await webService.apiCall(
            endpoint: "/users/login",
            method: .post,
            responseType: LoginDTOResponse.self,
            body: loginRequest
        )
        //on sauvegarde le token dans le keychain
        try KeychainManager.save(token: response.token)
        
        print("Connexion success !")
        print("JWT reçu :", response.token)
        
        //le user est connecté
        isLoggedIn = true
    }
}
