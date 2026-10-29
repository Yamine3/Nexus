//
//  loginTopCard.swift
//  testNexusProject
//
//  Created by apprenant92 on 28/10/2026.
//

import SwiftUI

struct authentificationTopCardView: View {
    
    var titleView: String
    
    var body: some View {
        
        Text(titleView)
            .font(.custom("Anton-Regular", size: 64))
            .foregroundStyle(.accentPurple)
            .padding(.leading, 40)
            .padding(.top, 20)
            .frame(maxWidth: .infinity, maxHeight: 245, alignment: .leading)
            .background()
            .clipShape(
                .rect(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 200,
                    topTrailingRadius: 0
                )
            )
    }
}
