//
//  LoginViewModel.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 26/05/24.
//

import SwiftUI

class LoginViewModel {
    func saveAuthUser(authUser: AuthUser) {
        if let encodedAuth = try? JSONEncoder().encode(authUser) {
            UserDefaults.standard.setValue(encodedAuth, forKey: "authUser")
        }
    }
    
    func getAuthUser() -> AuthUser? {
        guard let storageAuth = UserDefaults.standard.data(forKey: "authUser") else { return nil }
        if let decodedAuth = try? JSONDecoder().decode(AuthUser.self, from: storageAuth) {
            return decodedAuth
        }
        
        return nil
    }
}
