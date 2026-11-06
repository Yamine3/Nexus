//
//  APIError.swift
//  nexus
//
//  Created by Apprenant 89 on 02/11/2026.
//

import Foundation

enum APIError: Error {
    case httpError(statusCode: Int, message: String)
    case unauthorized 
}
