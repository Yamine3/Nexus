//
//  WorkshopsView.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//

import SwiftUI

struct WorkshopsView: View {
    
    @State private var viewModel = WorkshopsViewModel()
    
    //    let workshops: [WorkshopModel]
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Workshops loading...")
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.workshops) { workshop in
                                WorkshopCardComponent(workshop: workshop)
                            }
                        }
                        .padding(.vertical)
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

/*
 func testAPI() async {
    let service = WebService()
    
    do {
        let workshops = try await service.apiCall(
            url: "http://localhost:8080/workshops",
            responseType: [WorkshopModel].self
        )
        
        for workshop in workshops {
            print(workshop.name)
        }
    } catch {
        print("Erreur API :", error)
    }
}


}

#Preview {
    WorkshopsView(
        workshops: [
            WorkshopModel(
                id: UUID(),
                name: "Intro to Manga",
                startTime: .now,
                endTime: .now.addingTimeInterval(3600),
                capacityMax: 30,
                remainingPlaces: 12,
                category: "Manga"
            ),
            WorkshopModel(
                id: UUID(),
                name: "Pop Quiz: 90's gaming",
                startTime: .now,
                endTime: .now.addingTimeInterval(7200),
                capacityMax: 20,
                remainingPlaces: 5,
                category: "Gaming"
            )
        ]
    )
}
*/
