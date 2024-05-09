//
//  ContentView.swift
//  BottomSheet
//
//  Created by Felipe Hoffmann on 09/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Button("Exibir tela 2") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented, content: {
                Text("Eu sou a tela 2")
//                    .presentationDetents([.medium, .large])
//                    .presentationDragIndicator(.hidden)
//                    .presentationDetents([.height(100)])
                    .presentationDetents([.fraction(0.9)])

            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
