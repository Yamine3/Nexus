//
//  WebService.swift
//  nexus
//
//  Created by Apprenant 89 on 22/10/2026.
//
import Foundation

final class WebService {
    
    private let session: URLSession
    //pour avoir notre adresse de base de l'api
    private let baseURL = "http://localhost:8080"
    
    init(
        session: URLSession = URLSession(
            configuration: .default
        )
    ) {
        self.session = session
    }
    
    func apiCall <T: Decodable> (
        endpoint: String,
        method: HTTPMethod = .get,
        queryParams: [String: String]? = nil,
        responseType: T.Type,
        body: (any Encodable)? = nil,
        token: String? = nil
    ) async throws -> T {
        
        // On construit l'url au complet
        
        let url = baseURL + endpoint
        
        //On prépare les composants url
        
        guard var urlComponents = URLComponents(
            string: url
        ) else {
            throw URLError(.badURL)
        }
        
        // On ajoute les paramètres de la requête
        if let queryParams {
            urlComponents.queryItems = queryParams.map {
                URLQueryItem(
                    name: $0.key,
                    value: $0.value
                )
            }
        }
        
        guard let finalURL = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        // On prépare la requête
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        
        // On ajoute le token si nécessaire (ex.: staff/festivalGoer)
        if let token {
            request.setValue(
                "Bearer \(token)",
                forHTTPHeaderField: "Authorization"
            )
        }
        
        // S'il y a un body on encode le body
        if let body {
            request.httpBody = try JSONEncoder().encode(body)
            
            request.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
        }
        
        // On envoie la requête
        let (data, response) = try await session.data(
            for: request
        )
        
        // On vérifie la réponse HTTP
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        print("URL appelée :", finalURL)
        print("Statut HTTP :", httpResponse.statusCode)
        print("Réponse serveur :", String(data: data, encoding: .utf8) ?? "")
        
        
        
        // On vérifie le statut et on décode le JSON
        switch httpResponse.statusCode {
        case 200...299:
            //Pour les dates 
            let decoder = JSONDecoder()
               decoder.dateDecodingStrategy = .iso8601

               let result = try decoder.decode(
                   responseType,
                   from: data
               )
//            let result = try JSONDecoder().decode(
//                responseType,
//                from: data
//            )
            return result
            
        default:
            throw URLError(.badServerResponse)
        }
    }
    
    
    func apiCallVoid(
        url: String,
        method: HTTPMethod,
        token: String
    ) async throws {
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        request.setValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authorization"
        )
        
        let (_, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
    }
}
