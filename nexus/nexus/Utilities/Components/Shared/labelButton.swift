//
//  authentificationLabelNavigation.swift
//  testNexusProject
//
//  Created by apprenant92 on 28/10/2026.
//

import SwiftUI

struct labelButton: View {
    
    var label: String
    var labelColor: Color
    var background: Color
    
    var body: some View {
        
        Text(label)
            .font(.custom("Inter18pt-Bold", size: 22))
            .foregroundStyle(labelColor)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(background)
            .cornerRadius(32)
        
    }
}

#Preview {
    labelButton(label: "Reserve a spot", labelColor: .white, background: .accentPurple)
}
