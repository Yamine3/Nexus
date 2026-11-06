////
////  WorkshopScheduleCard.swift
////  nexus
////
////  Created by apprenant92 on 02/11/2026.
////
//
//
////
////  WorkshopCard.swift
////  nexus
////
////  Created by Apprenant 109 on 08/10/2026.
////
//
import SwiftUI


struct WorkshopScheduleCard: View {
    
    let reservation: ReservationModel
    @State private var showCancelConfirmation = false
    @Environment(MyScheduleViewModel.self) var scheduleVM
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack(spacing: 0) {
                
                Rectangle()
                    .fill(Color.secondaryPurple)
                    .frame(width: 40)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    VStack(alignment: .leading) {
                        
                        Text(reservation.workshop.name)
                            .font(.custom("Inter18pt-Bold", size: 18))
                        
                        
                        Text(reservation.workshop.category)
                            .font(.custom("Inter18pt-Regular", size: 16))
                    }
                    
                    HStack {
                        
                        Text(reservation.status.rawValue)
                            .font(.custom("Inter18pt-Medium", size: 14))
                            .padding(.vertical, 2)
                            .padding(.horizontal, 5)
                            .background(.backgroundPurple)
                            .cornerRadius(10)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        
                        Label("\(reservation.workshop.startTime.formatted(date: .omitted, time: .shortened)) - \(reservation.workshop.endTime.formatted(date: .omitted, time: .shortened))", systemImage: "clock")
                            .font(.custom("Inter18pt-Bold", size: 16))
                        
                        Spacer()
                        
                        HStack {
                            
                            Button {
                                showCancelConfirmation = true
                            } label: {
                                labelLittleButton(
                                    label: "Cancel",
                                    labelColor: .white,
                                    background: .accentRed
                                )
                            }
                            .confirmationDialog(
                                "Cancel reservation?",
                                isPresented: $showCancelConfirmation,
                                titleVisibility: .visible
                            ) {
                                Button("Yes, cancel reservation", role: .destructive) {
                                    Task {
                                        await scheduleVM.cancelReservation(
                                            reservationID: reservation.id
                                        )
                                    }
                                }
                                
                                Button("Keep reservation", role: .cancel) { }
                                
                            } message: {
                                Text("Are you sure you want to cancel your reservation for this workshop?")
                            }
                            
                        }
                        .frame(width: 105)
                        
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
    }
}
