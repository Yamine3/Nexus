//
//  SignUpViewModel.swift
//  nexus
//
//  Created by Apprenant 89 on 05/11/2026.
//

import Foundation

@Observable

final class SignUpViewModel {
    
    //    private let authService : AuthService
    
    var name = ""
    var email = ""
    var password = ""
    var confirmPassword = ""
    
    var isLoading = false
    var errorMessage: String?
    var isSignUpSuccessful = false
    
    //    init(
    //        authService: AuthService = AuthService(
    //            webService: WebService()
    //        )
    //    ) {
    //        self.authService = authService
    //    }
    //
    
    private func validateForm() -> Bool {
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter your name."
            return false
        }
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter your email."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email address."
            return false
        }
        
        guard password.count >= 8 else {
            errorMessage = "Password must be at least 8 characters long."
            return false
        }
        
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return false
        }
        return true
    }
    
    func signUp(authService: AuthService) async {
        
        guard !isLoading else { return }
        
        errorMessage = nil
        
        guard validateForm() else { return }
        
        isLoading = true
        
        defer { isLoading = false }
        
        do {
            
            try await authService.signUp(
                name: name.trimmingCharacters(in: .whitespaces),
                email: email.trimmingCharacters(in: .whitespaces),
                password: password
            )
            
            isSignUpSuccessful = true
            
            print("Sign-up success")
            
        } catch {
            
            errorMessage = "Error: \(error.localizedDescription)"
            
            print("sign-up error:", error)
        }
    }
}
