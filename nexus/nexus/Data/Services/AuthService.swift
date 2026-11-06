//
//  AuthService.swift
//  nexus
//
//  Created by Apprenant 89 on 30/10/2026.
//

import Foundation

@Observable
final class AuthService {

    private var webService: WebService = WebService()
    
    var isLoggedIn: Bool = false

    init(webService: WebService) {
        self.webService = webService
        //pour vérifier si un token existe déjà dans le keychain au lancement
//        if let token = try? KeychainManager.read(), !token.isEmpty {
//                self.isLoggedIn = true
//            }
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
    
    func signUp(
        name: String,
        email: String,
        password: String
    ) async throws {
        
        let signUpRequest = SignUpDTORequest(
            name: name,
            email: email,
            password: password
        )
        
        let response = try await webService.apiCall(
            endpoint: "/users",
            method: .post,
            responseType:SignUpDTOResponse.self,
            body: signUpRequest
        )
        
        try KeychainManager.save(token: response.token)
        
        isLoggedIn = true 
    }
    
    func logout() {
        try? KeychainManager.delete()
        isLoggedIn = false
    }
    
    func handleError(_ error : Error) {
        if let apiError = error as? APIError, case .unauthorized = apiError {
            print("expired/invalid token: automatic log-out")
            logout()
        }
    }
}
