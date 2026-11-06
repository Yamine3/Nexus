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
    @State private var showCancelConfirmation = false
    @Environment(AuthService.self) private var authService
    @Environment(MyScheduleViewModel.self) private var scheduleVM
    @Environment(WorkshopsViewModel.self) private var workshopVM
    
    
    private var isFull: Bool {
        guard let workshop = viewModel.workshopDetail else {
            return false
        }
        
        return workshop.remainingPlaces <= 0
    }
    
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
                        Button {
                            if viewModel.isReserved {
                                showCancelConfirmation = true
                            } else {
                                Task {
                                    await viewModel.reserveWorkshop(
                                        workshopID: workshopDetail.id
                                    )
                                    
                                    if viewModel.isReserved {
                                        await workshopVM.loadWorkshops()
                                        await viewModel.fetchWorkshopDetails(id: workshopId)
                                        await scheduleVM.loadMySchedule()
                                    }
                                }
                            }
                        } label: {
                            labelButton(
                                label: viewModel.isReserved
                                ? "Cancel reservation"
                                : isFull
                                ? "Workshop full"
                                : "Reserve a spot",
                                
                                labelColor: .white,
                                
                                background: viewModel.isReserved
                                ? .accentRed
                                : isFull
                                ? .gray
                                : .accentPurple
                            )
                        }
                        .disabled(viewModel.isLoading || (isFull && !viewModel.isReserved))
                        
                        .confirmationDialog(
                            "Cancel reservation?",
                            isPresented: $showCancelConfirmation,
                            titleVisibility: .visible
                        ) {
                            Button("Yes, cancel reservation", role: .destructive) {
                                Task {
                                    if let reservationID = viewModel.reservationID {
                                        
                                        await viewModel.cancelReservation(
                                            reservationID: reservationID
                                        )
                                        
                                        if !viewModel.isReserved {
                                            await workshopVM.loadWorkshops()
                                            await viewModel.fetchWorkshopDetails(id: workshopId)
                                            await scheduleVM.loadMySchedule()
                                        }
                                    }
                                }
                            }
                            
                            Button("Keep reservation", role: .cancel) { }
                            
                        } message: {
                            Text("Are you sure you want to cancel your reservation for this workshop?")
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
            await viewModel.fetchWorkshopDetails(id: workshopId/*, authService: authService*/)
            await viewModel.checkReservation(workshopID: workshopId/*, authService: authService*/)
        }
        .toolbar(.hidden, for: .tabBar)
    }
}
