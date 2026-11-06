//
//  ReservationModel.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//
import SwiftUI
import Foundation

enum StatusEnum: String, Decodable, Hashable, CaseIterable {
    case valid = "validated"
    case pending = "pending"
    case cancel = "cancelled"
}

struct ReservationModel:Decodable, Hashable, Identifiable {
    let id : UUID
    let workshop : WorkshopModel
    let status : StatusEnum
}
