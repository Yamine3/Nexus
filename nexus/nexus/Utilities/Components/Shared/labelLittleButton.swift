//
//  labelLittleButton.swift
//  testNexusProject
//
//  Created by apprenant92 on 30/10/2026.
//

import SwiftUI

struct labelLittleButton: View {
    
    var label: String
    var labelColor: Color
    var background: Color
    
    var body: some View {
        
        Text(label)
            .font(.custom("Inter18pt-Bold", size: 16))
            .foregroundStyle(labelColor)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(background)
            .cornerRadius(32)
        
    }
}

#Preview {
    labelLittleButton(label: "Reserve a spot", labelColor: .white, background: .accentPurple)
}
