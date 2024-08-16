//
//  HomeViewModel.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 03/08/24.
//

import SwiftUI

@Observable
class HomeViewModel {
    
    var isMuted: Bool = true

    var postList: [PostData] = [
        PostData(profileImage: "logo-BF", userName: "BackFront", postImage: nil, isLiked: false, isSaved: true, caption: "Você acredita?", isVideo: true, videoURL: "bfVideo"),
        PostData(profileImage: "user3", userName: "Roberto", postImage: "dogs", isLiked: false, isSaved: false, caption: "Você acredita?", isVideo: false, videoURL: nil),
        PostData(profileImage: "user2", userName: "Mario", postImage: "dogs", isLiked: false, isSaved: false, caption: "Você acredita?", isVideo: false, videoURL: nil),
        PostData(profileImage: "youtubelogo", userName: "criadoresyoutubebrasil", postImage: "youtube-post", isLiked: false, isSaved: true, caption: "Você acredita?", isVideo: false, videoURL: nil),
        PostData(profileImage: "user5", userName: "Cleiton", postImage: "sonhos", isLiked: false, isSaved: false, caption: "Você acredita?", isVideo: true, videoURL: "bfVideo"),
        PostData(profileImage: "user2", userName: "Mario", postImage: nil, isLiked: false, isSaved: true, caption: "Você acredita?", isVideo: true, videoURL: "cars"),
    ]
    
    var storyList: [StoryData] = [
        StoryData(image: "user5", name: "Seu story", isMyStory: true),
        StoryData(image: "user1", name: "Cleiton", isMyStory: false),
        StoryData(image: "user2", name: "Mario", isMyStory: false),
        StoryData(image: "user3", name: "Roberto", isMyStory: false),
        StoryData(image: "user4", name: "Junio", isMyStory: false),
    ]

}
