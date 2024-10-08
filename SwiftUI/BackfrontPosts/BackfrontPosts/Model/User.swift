//
//  User.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 11/08/24.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    let userName: String
    let userImage: String
}
