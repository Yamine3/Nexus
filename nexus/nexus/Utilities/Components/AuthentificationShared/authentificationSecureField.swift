//
//  loginTextField.swift
//  testNexusProject
//
//  Created by apprenant92 on 28/10/2026.
//

import SwiftUI

struct authentificationSecureField: View {
    
    var placeholderLogin: String
    @State var textInTextField: String = ""
    
    var body: some View {
        
        SecureField("", text: $textInTextField, prompt: Text(placeholderLogin)
            .foregroundStyle(.white))
        .font(.custom("Inter18pt-Regular", size: 17))
        .foregroundStyle(.white)
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke (Color.white, lineWidth: 1)
        }
    }
}
