//
//  Untitled.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//
//import SwiftUI
import Foundation

struct WorkshopModel: Decodable, Hashable, Identifiable {
    let id: UUID
    let name: String
    let startTime: Date
    let endTime: Date
    let capacityMax: Int
    let remainingPlaces: Int
    let category: String
}
