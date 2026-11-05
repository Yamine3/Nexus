
//
//  LoginViewModel.swift
//  nexus
//
//  Created by Apprenant 89 on 02/11/2026.
//
import Foundation

@Observable
final class LoginViewModel {
//    //à faire en singleton?
//    private let authService : AuthService
    
    // on doit stocker l'email
    var email = ""
    
    //on doit stocker le mdp
    var password = ""
    
    //savoir si la connexion est en cours
    var isLoading = false
    
    //stockage d'un éventuel message d'erreur
    var errorMessage: String?
    

    //on initialise le service
//    init(
//        authService: AuthService = AuthService(webService: WebService())
//    ) {
//        self.authService = authService
//    }
    
    func login(authService: AuthService) async {
        
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        defer { isLoading = false }
        
        do {
            try await authService.login(
                email: email,
                password: password
            )
            
            print("VM réception des données ok")
            
        } catch {
            errorMessage = "Erreur: \(error.localizedDescription)"
        }
    }
}
