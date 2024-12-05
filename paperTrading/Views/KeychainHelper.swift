//
//  KeychainHelper.swift
//  paperTrading
//
//  Created by Piyush Anand on 23/11/24.
//

import Foundation
import Security

class KeychainHelper {
    static let shared = KeychainHelper() // Singleton instance

    func save(_ key: String, value: String) {
        let data = value.data(using: .utf8)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        SecItemDelete(query as CFDictionary) // Remove old value if it exists
        SecItemAdd(query as CFDictionary, nil)
    }

    func get(_ key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var data: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &data)
        if let data = data as? Data {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }

    func delete(_ key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        SecItemDelete(query as CFDictionary)
    }
}
