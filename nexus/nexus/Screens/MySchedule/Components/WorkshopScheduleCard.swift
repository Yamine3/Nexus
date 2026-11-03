//
//  WorkshopScheduleCard.swift
//  nexus
//
//  Created by apprenant92 on 02/11/2026.
//


//
//  WorkshopCard.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//

import SwiftUI

struct WorkshopScheduleCard: View {
    
    let workshop : WorkshopModel
    @State var isCancel: Bool = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack(spacing: 0) {
                
                Rectangle()
                    .fill(Color.secondaryPurple)
                    .frame(width: 40)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    VStack(alignment: .leading) {
                        
                        Text(workshop.name)
                            .font(.custom("Inter18pt-Bold", size: 18))
                        
                        
                        Text(workshop.category)
                            .font(.custom("Inter18pt-Regular", size: 16))
                    }
                    
                    HStack {
                        
                        workshopScheduleStatuCard(reservation: ReservationModel(workshop: WorkshopModel(
                            id: UUID(),
                            name: "Pop Quiz: 90's gaming",
                            startTime: .now,
                            endTime: .now.addingTimeInterval(7200),
                            capacityMax: 20,
                            remainingPlaces: 5,
                            category: "Gaming"
                        ),
                            status: StatusEnum.valid))
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        Label("\(workshop.startTime.formatted(date: .omitted, time: .shortened)) - \(workshop.endTime.formatted(date: .omitted, time: .shortened))", systemImage: "clock")
                            .font(.custom("Inter18pt-Bold", size: 16))
                        
                        Spacer()
                        
                        if !isCancel {
                            HStack {
                                Button {
                                    isCancel.toggle()
                                } label: {
                                    labelLittleButton(label: "Cancel", labelColor: .white, background: .accentRed)
                                }
                            }
                            .frame(width: 105)
                        }
                    }
                    .frame(height: 40)
                }
                .padding(.horizontal, 12)
            }
            .frame(height: 135)
        }
        .foregroundStyle(.black)
        .background(.white)
        .cornerRadius(16)
        .frame(height: 135)
        .shadow(color: .black.opacity(0.12), radius: 6, x: 0, y: 3)
        .padding(.horizontal,12)
        .strikethrough(isCancel)
    }
}

#Preview {
    WorkshopScheduleCard(workshop: WorkshopModel(
        id: UUID(),
        name: "Pop Quiz: 90's gaming",
        startTime: .now,
        endTime: .now.addingTimeInterval(7200),
        capacityMax: 20,
        remainingPlaces: 5,
        category: "Gaming"
    ))
}
