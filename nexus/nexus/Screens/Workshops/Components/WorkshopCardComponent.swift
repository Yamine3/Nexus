//
//  WorkshopCard.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//

import SwiftUI

struct WorkshopCardComponent: View {
    let workshop : WorkshopModel
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 40)

            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading) {
                    Text(workshop.name)
                        .font(.headline)
                        .fontWeight(.bold)


                    Text(workshop.category)
                        .font(.subheadline)
                }
                HStack(alignment: .bottom) {
                    Label("\(workshop.startTime.formatted(date: .omitted, time: .shortened)) - \(workshop.endTime.formatted(date: .omitted, time: .shortened))", systemImage: "clock")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    Spacer()

                    VStack(alignment: .trailing, spacing: 6) {
                        Text("\(workshop.remainingPlaces)/\(workshop.capacityMax) slots left")
                        Button {
                        } label: {
                            Text("Détails")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 22)
                                .padding(.vertical, 8)
                                .background(
                                    Capsule()
                                        .fill(Color(red: 0.17, green: 0.11, blue: 0.40))
                                )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(12)
        }
        .foregroundStyle(.black)
        .frame(maxHeight: 130)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.12), radius: 6, x: 0, y: 3)
        .padding()
    }
}
