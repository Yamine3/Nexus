//
//  redirectionRow.swift
//  testNexusProject
//
//  Created by apprenant92 on 28/10/2026.
//

import SwiftUI

struct redirectionToLogInRow: View {
    
    var redirectionQuestion: String
    
    var body: some View {
        
        HStack {
            
            Text(redirectionQuestion)
                .font(.custom("Inter18pt-Regular", size: 14))
                .foregroundStyle(.white)
            
            NavigationLink {
                LoginView()
            } label: {
                Text("Log-in")
                    .font(.custom("Inter18pt-Regular", size: 14))
                    .foregroundStyle(.white)
                    .underline()
            }
        }
    }
}
