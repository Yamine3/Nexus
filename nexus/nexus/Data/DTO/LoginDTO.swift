//
//  LoginDTO.swift
//  nexus
//
//  Created by Apprenant 109 on 08/10/2026.
//


import Foundation

struct LoginDTORequest: Encodable {
    let email: String
    let password: String
}

struct LoginDTOResponse: Decodable {
    let token: String
}


