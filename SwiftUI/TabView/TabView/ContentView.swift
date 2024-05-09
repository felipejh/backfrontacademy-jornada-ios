//
//  ContentView.swift
//  TabView
//
//  Created by Felipe Hoffmann on 09/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Conteúdo primeira aba")
//            HomeScreen()
                .tabItem {
                    if selection == 0 {
                        Label("Primeira tela", systemImage: "1.circle")
                    }
                    Label("Primeira tela", systemImage: "book.fill")
                }
                .tag(0)
            
            Text("Conteúdo segunda aba")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Segunda tela")
                }
                .tag(1)
        }
        .tint(.green)
    }
}

#Preview {
    ContentView()
}
