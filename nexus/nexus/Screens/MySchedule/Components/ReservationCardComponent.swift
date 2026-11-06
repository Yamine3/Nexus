//
//  ReservationCard.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//

import SwiftUI

struct ReservationCardComponent: View {
    
    
    let reservation: ReservationModel

    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    VStack(alignment: .leading) {
                        
                        Text(reservation.workshop.name)
                            .font(.custom("Inter18pt-Bold", size: 18))
                        
                        
                        Text(reservation.workshop.category)
                            .font(.custom("Inter18pt-Regular", size: 16))
                    }
                    
                    HStack {
                        
                        Text("\(reservation.workshop.remainingPlaces)/\(reservation.workshop.capacityMax) slots left")
                            .font(.custom("Inter18pt-Medium", size: 14))
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    HStack {
                        
                        Label("\(reservation.workshop.startTime.formatted(date: .omitted, time: .shortened)) - \(reservation.workshop.endTime.formatted(date: .omitted, time: .shortened))", systemImage: "clock")
                            .font(.custom("Inter18pt-Bold", size: 16))
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, 12)
            }
            .frame(height: 135)
        }
        .foregroundStyle(.black)
        .cornerRadius(16)
        .frame(height: 135)
        .overlay {
        }
        .shadow(color: .black.opacity(0.12), radius: 6, x: 0, y: 3)
    }
}
