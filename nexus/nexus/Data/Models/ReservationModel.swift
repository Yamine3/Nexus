//
//  ReservationModel.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//
import SwiftUI
import Foundation

enum StatusEnum :Hashable, CaseIterable {
    case valide
    case pending
    case cancel
}

struct ReservationModel: Hashable, Identifiable {
    let id = UUID()
    let workshop : WorkshopModel
    let status : StatusEnum
}

let r: [ReservationModel] = [
    ReservationModel(workshop: w[0], status: .valide),
    ReservationModel(workshop: w[1], status: .valide),
    ReservationModel(workshop: w[2], status: .valide),
    ReservationModel(workshop: w[3], status: .valide)
]
