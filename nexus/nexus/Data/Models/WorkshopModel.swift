//
//  Untitled.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//
import SwiftUI
import Foundation

struct WorkshopModel: Hashable, Identifiable {
    let id = UUID()
    var title : String
    var date : Date
    var startTime : Date
    var endTime : Date
    var capacityMax : Int
    var totalSubscribers : Int
    var description : String
}

let w: [WorkshopModel] = [
    WorkshopModel(title: "Workshop 1", date: .now, startTime: .now, endTime: .now, capacityMax: 3, totalSubscribers: 3, description: "Description 1"),
    WorkshopModel(title: "Workshop 2", date: .now, startTime: .now, endTime: .now, capacityMax: 3, totalSubscribers: 3, description: "Description 2"),
    WorkshopModel(title: "Workshop 3", date: .now, startTime: .now, endTime: .now, capacityMax: 3, totalSubscribers: 3, description: "Description 3"),
    WorkshopModel(title: "Workshop 4", date: .now, startTime: .now, endTime: .now, capacityMax: 3, totalSubscribers: 3, description: "Description 4"),
    WorkshopModel(title: "Workshop 5", date: .now, startTime: .now, endTime: .now, capacityMax: 3, totalSubscribers: 3, description: "Description 5")
]
