//
//  KeychainManager.swift
//  nexus
//
//  Created by Apprenant 89 on 30/10/2026.
//

import Foundation
import Security

enum KeychainError: Error {
    case saveError(OSStatus)
    case retrieveError(OSStatus)
    case failToExtractInfo
    case deleteError(OSStatus)
}

struct KeychainManager {
    
    static func save(token: String) throws {
        
        //si une erreur arrive, elle est transmise à la fonction qui a appelé la func save()
        try delete()
        
        //On convertit le JWT en data
        let tokenPasswordData = Data(token.utf8)
        
        //On prépare les information pour le Keychain
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "NexusJWT",
            kSecValueData as String: tokenPasswordData
        ]
        
        //On enregistre le token
        let status = SecItemAdd(query as CFDictionary, nil)
        
        //on vérifie si l'enregistrement a fonctionné
        guard status == errSecSuccess else {
            throw KeychainError.saveError(status)
        }
    }
    
    static func read() throws -> String? {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "NexusJWT",
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        
        let status = SecItemCopyMatching(
            query as CFDictionary,
            &result
        )
        
        guard status != errSecItemNotFound else {
            return nil
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.retrieveError(status)
        }
        
        guard let tokenPasswordData = result as? Data else {
            throw KeychainError.failToExtractInfo
        }
        
        return String(data: tokenPasswordData, encoding: .utf8)
    }
    
    
    static func delete() throws {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "NexusJWT"
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        guard status == errSecSuccess ||
                status == errSecItemNotFound else {
            throw KeychainError.deleteError(status)
        }
    }
    
    
}
