//
//  AuthService.swift
//  nexus
//
//  Created by Apprenant 89 on 30/10/2026.
//

import Foundation

final class AuthService {

    private let webService: WebService

    init(webService: WebService) {
        self.webService = webService
    }

    func login(
        email: String,
        password: String
    ) async throws {

        let loginRequest = LoginDTORequest(
            email: email,
            password: password
        )

        let response = try await webService.apiCall(
            endpoint: "/users/login",
            method: .post,
            responseType: LoginDTOResponse.self,
            body: loginRequest
        )

        try KeychainManager.save(token: response.token)
    }
}
