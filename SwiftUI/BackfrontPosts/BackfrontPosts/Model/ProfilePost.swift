//
//  ProfilePost.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 12/08/24.
//

import Foundation

enum PostType: String {
    case video
    case multiple
}

struct ProfilePost: Identifiable {
    let id = UUID()
    let image: String
    let type: PostType
}
