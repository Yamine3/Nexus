//
//  WorkshopCard.swift
//  nexus
//
//  Created by apprenant92 on 03/11/2026.
//

import SwiftUI

struct WorkshopCard: View {
    
    let workshop : WorkshopModel
    
    var isFull: Bool {
        workshop.remainingPlaces == 0
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack(spacing: 0) {
                
                if !isFull {
                    Rectangle()
                        .fill(Color.secondaryPurple)
                        .frame(width: 40)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    VStack(alignment: .leading) {
                        
                        Text(workshop.name)
                            .font(.custom("Inter18pt-Bold", size: 18))
                        
                        
                        Text(workshop.category)
                            .font(.custom("Inter18pt-Regular", size: 16))
                    }
                    
                    HStack {
                        
                        Text("\(workshop.remainingPlaces)/\(workshop.capacityMax) slots left")
                            .font(.custom("Inter18pt-Medium", size: 14))
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    HStack {
                        
                        Label("\(workshop.startTime.formatted(date: .omitted, time: .shortened)) - \(workshop.endTime.formatted(date: .omitted, time: .shortened))", systemImage: "clock")
                            .font(.custom("Inter18pt-Bold", size: 16))
                        
                        Spacer()
                        
                        
                        labelLittleButton(label: isFull ? "Full" : "Details", labelColor: .white, background: isFull ? Color.secondaryGray : .accentPurple)
                            .frame(width: isFull ? 95 : 105)
                    }
                }
                .padding(.horizontal, 12)
            }
            .frame(height: 135)
            if isFull {
                triangleComponents()
                    .fill(.secondaryPurple)
                    .frame(width: 205, height: 50)
            }
        }
        .foregroundStyle(.black)
        .background(isFull ? .backgroundPurple : .white)
        .cornerRadius(16)
        .frame(height: 135)
        .overlay {
            if isFull {
                RoundedRectangle(cornerRadius: 15)
                    .stroke (.secondaryPurple, lineWidth: 2)
            }
        }
        .shadow(color: .black.opacity(0.12), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    WorkshopCard(workshop: WorkshopModel(
        id: UUID(),
        name: "Introduction à Vapor & Swift Server",
        startTime: Calendar.current.date(byAdding: .hour, value: 2, to: Date()) ?? Date(),
        endTime: Calendar.current.date(byAdding: .hour, value: 4, to: Date()) ?? Date(),
        capacityMax: 15,
        remainingPlaces: 3,
        category: "Backend"
    ))
}
