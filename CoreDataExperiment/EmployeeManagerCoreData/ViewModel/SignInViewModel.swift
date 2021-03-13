//
//  SignInViewModel.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import Foundation

class SignInViewModel {
    
    func storeCredentialsInKeychain(username: String, password: String, server: String) {
        Keychain.shared.storeCredentialsInKeychain(username: username, password: password, server: server)
    }
    
    func retrieveCredentialsFromKeychain(server: String) -> (String, String) {
        return Keychain.shared.retrieveCredentialsFromKeychain(server: server)
    }
}
