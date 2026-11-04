//
//  WorkshopsView.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//

import SwiftUI

struct WorkshopsView: View {
    
    @State private var workshopVM = WorkshopsViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if workshopVM.isLoading {
                    ProgressView("Workshops loading...")
                } else {
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(workshopVM.workshops) { workshop in
                                NavigationLink {
                                    WorkshopDetailsView(workshopId: workshop.id)
                                } label: {
                                    WorkshopCard(workshop: workshop)
                                }                           }
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 12)
                    }
                }
            }
            .navigationTitle("Workshops")
        }
        .task {
            await workshopVM.loadWorkshops()
        }
        .environment(workshopVM)
//        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    WorkshopsView()
}
