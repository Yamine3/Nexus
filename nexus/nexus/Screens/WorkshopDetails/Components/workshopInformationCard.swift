//
//  workshopInformationCard.swift
//  testNexusProject
//
//  Created by apprenant92 on 29/10/2026.
//

import SwiftUI

struct workshopInformationCard: View {
    
    var symbol: String
    var title: String
    var text: String
    
    var body: some View {
        
        HStack(spacing: 5) {
            
            Image(systemName: symbol)
                .font(.custom("Inter18pt-SemBold", size: 24))
                .frame(width: 50, height: 50)
                .background(.backgroundGray)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                
                Text(title)
                    .font(.custom("Inter18pt-Medium", size: 16))
                
                Text(text)
                    .font(.custom("Inter18pt-Bold", size: 16))
            }
        }
        .frame(width: 175, alignment: .leading)
    }
}
