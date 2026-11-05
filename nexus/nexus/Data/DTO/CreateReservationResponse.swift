//
//  CreateReservationResponse.swift
//  nexus
//
//  Created by apprenant92 on 04/11/2026.
//

import Foundation

struct CreateReservationResponse: Decodable {
    let id: UUID
    let status: StatusEnum
}
