//
//  PostGridView.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 2024-08-19.
//

import SwiftUI

struct PostGridView: View {
    
    let data: [ProfilePost]
    let gridLayout: [GridItem] = Array(repeating: .init(.flexible(), spacing: 2), count: 3)
    
    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: 2) {
            ForEach(data) { item in
                ZStack(alignment: .topTrailing) {
                    Image(item.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: (UIScreen.main.bounds.width - CGFloat(gridLayout.count * 2)) / CGFloat(gridLayout.count))
                    
                    Image(item.type.rawValue)
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .padding(5)
                        .foregroundStyle(Color.white)
                }
            }
        }
    }
}

#Preview {
    PostGridView(data: ProfilePostMock)
}
