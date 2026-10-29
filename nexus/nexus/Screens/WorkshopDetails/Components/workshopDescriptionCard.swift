//
//  workshopDescriptionCard.swift
//  testNexusProject
//
//  Created by apprenant92 on 29/10/2026.
//

import SwiftUI

struct workshopDescriptionCard: View {
    
    var workshopDescription: String
    
    var body: some View {
        
        Text(workshopDescription)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
        
    }
}

#Preview {
    workshopDescriptionCard(workshopDescription: "Join us for a hands-on introduction to the basics of Japanese-style manga art. We’ll start with fundamental concepts before diving into practical drawing techniques.\n\nWhat you'll learn: \nFacial anatomy & proportions \nDynamic expressions & emotions \nInking basics & line work \nBeginner friendly — All materials provided on site.")
}
