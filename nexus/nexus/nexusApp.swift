//
//  nexusApp.swift
//  nexus
//
//  Created by Apprenant 109 on 15/09/2026.
//

import SwiftUI

@main
struct nexusApp: App {
    
    @State private var authService = AuthService(
        webService: WebService()
    )
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authService.isLoggedIn {
                    TabBarView()
                } else {
                    LoginView()
                }
            }
            .environment(authService)
        }
    }
}
