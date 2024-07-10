//
//  HomeView.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 27/05/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 237/255, green: 237/255, blue: 237/255)
                Text("Hello, World!")
            }.toolbarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Image("BF_Logo")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 100)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Button {
                                print("Go search")
                            } label: {
                                Image("search")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 25, height: 25)
                            }
                            Button {
                                print("message")
                            } label: {
                                ZStack {
                                    Image("message")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 25, height: 25)
                                    Text("3")
                                        .font(.system(size: 13, weight: .bold))
                                        .frame(width: 18, height: 18)
                                        .background(Color.red)
                                        .foregroundStyle(.white)
                                        .clipShape(Circle())
                                        .offset(x: 9, y: -9)
                                }
                            }
                        }
                        
                    }
                })
            
        }

    }
}

#Preview {
    HomeView()
}
