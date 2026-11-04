//
//  WorkshopsView.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//

import SwiftUI

struct WorkshopsView: View {
    
    @State private var viewModel = WorkshopsViewModel()

    var body: some View {
        NavigationStack {
            NavigationLink {
                MyScheduleView()
            } label: {
                Text("click")
            }
            Group {
                if viewModel.isLoading {
                    ProgressView("Workshops loading...")
                } else {
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(viewModel.workshops) { workshop in
                                WorkshopCard(workshop: workshop)
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
            await viewModel.loadWorkshops()
        }
    }
}

#Preview {
    WorkshopsView()
}
