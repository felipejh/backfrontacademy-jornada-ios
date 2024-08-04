//
//  PostView.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 03/08/24.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostData
    @State var isLikeAnimation: Bool = true
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(post.profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 33, height: 33)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color.gray, lineWidth: 0.5)
                    }
                Text(post.userName)
                    .font(Font.system(size: 14, weight: .semibold))
                
                Spacer()
                
                Button {
                    print("options")
                } label: {
                    Image("more")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                }

                
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            
            ZStack {
                if !post.isVideo {
                    Image(post.postImage ?? "error")
                        .resizable()
                        .scaledToFit()
                        .onTapGesture(count: 2, perform: {
                            tappedLike()
                        })
                } else {
                    // video
                }
                
                Image("white-heart")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 170)
                    .scaleEffect(isLikeAnimation ? 1 : 0)
                    .opacity(isLikeAnimation ? 1 : 0)
                    .animation(.spring, value: isLikeAnimation)
            }
                        
            HStack {
                
            }
            
        }
    }
    
    func tappedLike() {
        isLikeAnimation = true
        post.isLiked = true
        
        hideAnimation()
    }
    
    func hideAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation {
                isLikeAnimation = false
            }
        }
    }
}

#Preview {
    PostView(post: PostMock[1])
}
