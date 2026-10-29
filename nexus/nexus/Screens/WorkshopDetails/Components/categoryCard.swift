//
//  categoryCard.swift
//  testNexusProject
//
//  Created by apprenant92 on 29/10/2026.
//

import SwiftUI

struct categoryCard: View {
    
    var categoryName: String
    
    var body: some View {
        
        Text(categoryName)
            .font(.custom("Inter18pt-Bold", size: 17))
            .foregroundStyle(.white)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(.accentBlue)
            .cornerRadius(32)
        
    }
}

#Preview {
    categoryCard(categoryName: "Manga")
}
