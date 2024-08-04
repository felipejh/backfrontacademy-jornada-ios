//
//  CustomVideoView.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 04/08/24.
//

import SwiftUI

struct CustomVideoView: View {
    
    @State var videoURL: URL?
    @Binding var isMuted: Bool
    
    init(url: String, isMuted: Binding<Bool>) {
        _isMuted = isMuted
        videoURL = Bundle.main.url(forResource: url, withExtension: "mp4")
        
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CustomVideoView(url: "demo2", isMuted: .constant(true))
}
