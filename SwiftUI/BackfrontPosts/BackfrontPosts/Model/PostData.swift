//
//  PostData.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 03/08/24.
//

import Foundation

struct PostData: Identifiable {
    var id = UUID()
    
    var profileImage: String
    var userName: String
    var postImage: String?
    var isLiked: Bool
    var isSaved: Bool
    var caption: String
    var isVideo: Bool
    var videoURL: String?
}
