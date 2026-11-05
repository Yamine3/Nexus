//
//  MyScheduleView.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//

import SwiftUI

struct MyScheduleView: View {
    
    @Environment(MyScheduleViewModel.self) private var scheduleVM
    
    var body: some View {
        NavigationStack {
            Group {
                if scheduleVM.isLoading {
                    ProgressView("Reservations loading...")
                } else if let error = scheduleVM.errorMessage {
                    Text(error).foregroundStyle(.red)
                } else if scheduleVM.reservations.isEmpty {
                    Text("Aucune réservation")
                } else {
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(scheduleVM.reservations) { reservation in
                                NavigationLink {
                                    WorkshopDetailsView(workshopId: reservation.workshop.id)
                                } label: {
                                    WorkshopScheduleCard(reservation: reservation)
                                }
                            }
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 12)
                    }
                }
            }
            .navigationTitle("My Schedule")
        }
        .task {
            await scheduleVM.loadMySchedule()
        }
    }
}

#Preview {
    MyScheduleView()
        .environment(MyScheduleViewModel())
}
