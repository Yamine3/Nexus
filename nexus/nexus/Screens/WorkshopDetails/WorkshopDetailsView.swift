//
//  WorkshopDetail.swift
//  testNexusProject
//
//  Created by apprenant92 on 29/10/2026.
//



import SwiftUI

struct WorkshopDetailsView: View {
    
    let workshopId: UUID
    
    @State private var viewModel = WorkshopDetailsViewModel()
    @Environment(MyScheduleViewModel.self) private var scheduleVM
    
    var body: some View {
        
        Group {
            if viewModel.isFetchingDetails {
                ProgressView("Loading workshop...")
                
            } else if let workshopDetail = viewModel.workshopDetail {
                
                ZStack(alignment: .bottom) {
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 0) {
                            
                            ZStack {
                                Color.secondaryPurple
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 185)
                            .padding(.top, 120)
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                categoryCard(
                                    categoryName: workshopDetail.category
                                )
                                
                                Text(workshopDetail.name)
                                    .font(.custom("Inter18pt-Bold", size: 28))
                                
                                HStack {
                                    workshopInformationCard(
                                        symbol: "calendar",
                                        title: "Date",
                                        text: workshopDetail.startTime.formatted(
                                            date: .abbreviated,
                                            time: .omitted
                                        )
                                    )
                                    
                                    workshopInformationCard(
                                        symbol: "hourglass.circle",
                                        title: "Time",
                                        text: "\(workshopDetail.startTime.formatted(date: .omitted, time: .shortened)) - \(workshopDetail.endTime.formatted(date: .omitted, time: .shortened))"
                                    )
                                }
                                
                                HStack {
                                    workshopInformationCard(
                                        symbol: "",
                                        title: "",
                                        text: ""
                                    )
                                    .opacity(0)
                                    
                                    workshopInformationCard(
                                        symbol: "person.3.fill",
                                        title: "Capacity",
                                        text: "\(workshopDetail.remainingPlaces)/\(workshopDetail.capacityMax) slots left"
                                    )
                                }
                                
                                Text("About this Workshop")
                                    .font(.custom("Inter18pt-Bold", size: 18))
                                
                                workshopDescriptionCard(
                                    workshopDescription: workshopDetail.description
                                )
                            }
                            .padding(.top, 10)
                            .padding(.horizontal, 20)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                    VStack {
                        
//                        Button {
//                            Task {
//                                if viewModel.isReserved {
//                                    if let reservationID = viewModel.reservationID {
//                                        await viewModel.cancelReservation(
//                                            reservationID: reservationID
//                                        )
//                                    }
//                                } else {
//                                    await viewModel.reserveWorkshop(
//                                        workshopID: workshopDetail.id
//                                    )
//                                }
//                            }
//                        }
                        Button {
                            Task {
                                if viewModel.isReserved {
                                    if let reservationID = viewModel.reservationID {

                                        await viewModel.cancelReservation(
                                            reservationID: reservationID
                                        )

                                        // Rafraîchir MyScheduleView après l'annulation réussie
                                        if !viewModel.isReserved {
                                            await scheduleVM.loadMySchedule()
                                        }
                                    }
                                } else {
                                    await viewModel.reserveWorkshop(
                                        workshopID: workshopDetail.id
                                    )

                                    // Rafraîchir aussi après une réservation réussie
                                    if viewModel.isReserved {
                                        await scheduleVM.loadMySchedule()
                                    }
                                }
                            }
                        }
                        label: {
                            labelButton(
                                label: viewModel.isReserved
                                ? "Cancel reservation"
                                : "Reserve a spot",
                                labelColor: .white,
                                background: viewModel.isReserved
                                ? .accentRed
                                : .accentPurple
                            )
                        }
                        .disabled(viewModel.isLoading)
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .font(.caption)
                                .foregroundStyle(.red)
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(workshopDetail.name)
                            .font(.custom("Inter18pt-Bold", size: 18))
                            .foregroundStyle(.black)
                            .lineLimit(1)
                            .minimumScaleFactor(0.7)
                    }
                }
                .background(.white)
                .ignoresSafeArea()
                
            } else {
                VStack(spacing: 12) {
                    Text("Unable to load workshop")
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .font(.caption)
                            .foregroundStyle(.red)
                    }
                }
            }
        }
        .task(id: workshopId) {
            await viewModel.fetchWorkshopDetails(id: workshopId)
            await viewModel.checkReservation(workshopID: workshopId)
        }
        .toolbar(.hidden, for: .tabBar)
    }
}
