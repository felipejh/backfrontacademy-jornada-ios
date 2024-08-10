//
//  CustomVideoView.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 04/08/24.
//

import SwiftUI
import AVKit

struct CustomVideoView: View {
    
    var videoURL: URL?
    @State var player = AVPlayer()
    @Binding var isMuted: Bool
    
    init(url: String, isMuted: Binding<Bool>) {
        _isMuted = isMuted
        videoURL = Bundle.main.url(forResource: url, withExtension: "mp4")
        
    }
    
    var body: some View {
        if let url = videoURL {
            ZStack(alignment: .bottomTrailing) {
                VideoPlayer(player: player)
                    .onAppear {
                        player = AVPlayer(url: url)
                        player.play()
                        player.isMuted = isMuted
                    }
                Color.white.opacity(0)
                Button(action: {
                    isMuted.toggle()
                }, label: {
                    Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.2.fill")
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .clipShape(Circle())
                })
            }
        } else {
            VStack{
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .foregroundStyle(.yellow)
                    .frame(width: 50, height: 50)
                Text("Ops, tivemos um problema com esse vídeo.")
                    .lineLimit(2)
            }
            
        }
    }
}

#Preview {
    CustomVideoView(url: "cars", isMuted: .constant(true))
}
