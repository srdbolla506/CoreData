//
//  Keychain.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import Foundation

class Keychain {
    
    static let shared = Keychain()
    
    private init() {
        
    }
    
    func storeCredentialsInKeychain(username: String, password: String, server: String) {
          let keychainItem = [
            kSecValueData: "\(password)".data(using: .utf8)!,
            kSecAttrAccount: username,
            kSecAttrServer: server,
            kSecClass: kSecClassInternetPassword,
            kSecReturnData: true,
            kSecReturnAttributes: true
          ] as CFDictionary
          
          var ref: AnyObject?
          
          let status = SecItemAdd(keychainItem, &ref)
//          let result = ref as! NSDictionary
          print("Operation finished with status: \(status)")
    }
    
    func retrieveCredentialsFromKeychain(server: String) -> (String, String) {
        let query = [
            kSecClass: kSecClassInternetPassword,
            kSecAttrServer: server,
            kSecReturnAttributes: true,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query, &result)
        
        print("Operation finished with statud: \(status)")
        
        let dictionary = result as? NSDictionary
        let username = dictionary?[kSecAttrAccount] as? String ?? ""
        if let passwordData = dictionary?[kSecValueData] as? Data {
            let password = String(data: passwordData, encoding: .utf8) ?? ""
            return (username, password)
        }
        return ("", "")
        
    }
}
