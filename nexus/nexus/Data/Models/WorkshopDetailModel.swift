//
//  WorkshopDetailModel.swift
//  nexus
//
//  Created by apprenant92 on 04/11/2026.
//

import Foundation

struct WorkshopDetailModel: Decodable, Hashable, Identifiable {
    let id: UUID
    let name: String
    let startTime: Date
    let endTime: Date
    let capacityMax: Int
    let remainingPlaces: Int
    let description: String
    let category: String
}
