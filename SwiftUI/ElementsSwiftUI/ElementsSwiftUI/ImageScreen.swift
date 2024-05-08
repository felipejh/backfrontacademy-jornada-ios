//
//  ImageScreen.swift
//  ElementsSwiftUI
//
//  Created by Felipe Hoffmann on 08/05/24.
//

import SwiftUI

struct ImageScreen: View {
    var body: some View {
        Image(systemName: "trash")
            .resizable()
//            .scaledToFit()
//            .scaledToFill()
            .rotationEffect(.degrees(40))
            .frame(width: 150, height: 150)
            .padding()
            .background(
//                Text("Hello")
//                Color.red
                Capsule()
                    .stroke(Color.pink, lineWidth: 2)
            )
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                print("Clicked")
            }
    }
}

#Preview {
    ImageScreen()
}
