////
////  workshopScheduleStatuCard.swift
////  testNexusProject
////
////  Created by apprenant92 on 30/10/2026.
////
//
import SwiftUI

struct workshopScheduleStatuCard: View {
    
    let reservation : ReservationModel
    
    var body: some View {
        
        Text(reservation.status.rawValue)
            .font(.custom("Inter18pt-Medium", size: 14))
            .padding(.vertical, 2)
            .padding(.horizontal, 5)
            .background(.backgroundPurple)
            .cornerRadius(10)
    }
}
