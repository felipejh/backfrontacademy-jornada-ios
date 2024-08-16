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
        ProfilePost(image: "thumb1", type: .multiple),
        ProfilePost(image: "thumb2", type: .video),
        ProfilePost(image: "thumb3", type: .multiple),
        ProfilePost(image: "thumb4", type: .video),
        ProfilePost(image: "thumb5", type: .multiple),
        ProfilePost(image: "thumb6", type: .video),
        ProfilePost(image: "thumb7", type: .multiple),
        ProfilePost(image: "thumb8", type: .video),
        ProfilePost(image: "thumb9", type: .multiple),
    ]
}
