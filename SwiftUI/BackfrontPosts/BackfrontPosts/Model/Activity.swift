//
//  Activity.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 11/08/24.
//

import Foundation

enum ActivityType {
    case liked
    case newFollower
    case suggestFollower
    case comment
}

struct Activity: Identifiable {
    var id = UUID()
    var activity: ActivityType
    var duration: String
    var usersInContext: [User]
    var posImage: String?
    var comment: String?
    
    func getUsernames() -> String {
        return usersInContext.map { $0.userName }.joined(separator: ", ")
    }
}
