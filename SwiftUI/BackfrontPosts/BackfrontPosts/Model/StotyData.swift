//
//  StotyData.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 14/07/24.
//

import Foundation

struct StoryData: Identifiable {
    var id = UUID()
    
    var image: String
    var name: String
    var isMyStory: Bool
}
