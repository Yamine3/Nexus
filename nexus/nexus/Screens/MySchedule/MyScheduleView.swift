//
//  MyScheduleView.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//

import SwiftUI

struct MyScheduleView: View {
    
    @State private var vm = MyScheduleViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading {
                    ProgressView("Reservations loading...")
                } else if let error = vm.errorMessage {
                    Text(error).foregroundStyle(.red)
                } else if vm.reservations.isEmpty {
                    Text("Aucune réservation")
                } else {
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(vm.reservations) { reservation in
                                ReservationCardComponent(reservation: reservation)
                            }
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 12)
                    }
                }
            }
            .navigationTitle("Workshops")
        }
        .task {
            await vm.loadMySchedule()
        }
    }
}

#Preview {
    MyScheduleView()
}
