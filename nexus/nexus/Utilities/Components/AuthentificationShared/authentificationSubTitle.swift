//
//  loginTextField.swift
//  testNexusProject
//
//  Created by apprenant92 on 28/10/2026.
//

import SwiftUI

struct authentificationSubTitle: View {
    
    var textFieldTitle: String
    
    var body: some View {
        
            Text(textFieldTitle)
                .font(.custom("Inter18pt-Bold", size: 17))
                .foregroundStyle(.white)
        }
    }
