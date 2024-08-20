//
//  ProfileViewModel.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 12/08/24.
//

import UIKit

@Observable
class ProfileViewModel {
    
    var higlightData: [HighlightData] = [
        HighlightData(name: "Recordações", cover: "h-1"),
        HighlightData(name: "Depoimentos", cover: "h-1"),
        HighlightData(name: "Quem somos", cover: "h-1"),
        HighlightData(name: "Eventos", cover: "h-1"),
        HighlightData(name: "Palestras", cover: "h-1"),
        HighlightData(name: "Perguntas", cover: "h-1"),
        HighlightData(name: "Live", cover: "h-1")
    ]
    
    var profilePostData: [ProfilePost] = [
        ProfilePost(image: "user4", type: .multiple),
        ProfilePost(image: "user2", type: .video),
        ProfilePost(image: "user2", type: .multiple),
        ProfilePost(image: "user1", type: .video),
        ProfilePost(image: "user2", type: .multiple),
        ProfilePost(image: "user1", type: .video),
        ProfilePost(image: "user2", type: .multiple),
        ProfilePost(image: "user2", type: .video),
        ProfilePost(image: "user4", type: .multiple),
    ]
}
