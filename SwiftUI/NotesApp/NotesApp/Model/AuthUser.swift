//
//  Auth.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 26/05/24.
//

import Foundation

struct AuthUser: Codable {
    var email: String
    var token: String
    
    init(email: String, token: String) {
        self.email = email
        self.token = token
    }
}
