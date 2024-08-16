//
//  ProfileView.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 27/05/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("Agora vai")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Text("backfronacademy")
                        .font(Font.system(size: 22, weight: .bold))
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("tappedMenuButton")
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 32, height: 22)
                    }
                    
                }
            })
        }
    }
}

#Preview {
    ProfileView()
}
