//
//  WorkshopsViewModel.swift
//  nexus
//
//  Created by Apprenant 89 on 28/10/2026.
//

import Foundation

@Observable

final class WorkshopsViewModel {
   
    private let workshopService = WorkshopService()
    
    var workshops: [WorkshopModel] = []
    var isLoading = false
    var errorMessage: String?
    
    func loadWorkshops() async {
        isLoading = true
        defer { isLoading = false }
        
        print(" début chargement wk")
        do {
            workshops = try await workshopService.fetchWorkshops()
            
            print("nbre de wk :", workshops.count)
            
            for workshop in workshops {
                print("wk:", workshop.name)
            }
        } catch {
            errorMessage = "Erreur: \(error.localizedDescription)"
            print("erreur api:", error)
        }
    }
}
