//
//  SignUpDTO.swift
//  nexus
//
//  Created by Apprenant 89 on 05/11/2026.
//

import Foundation

struct SignUpDTORequest: Encodable {
    let name: String
    let email: String
    let password : String
}

struct SignUpDTOResponse : Decodable {
    let token: String 
}
