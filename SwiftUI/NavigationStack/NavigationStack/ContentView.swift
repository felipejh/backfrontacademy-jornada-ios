//
//  ContentView.swift
//  NavigationStack
//
//  Created by Felipe Hoffmann on 08/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationView {
//            VStack(spacing: 10.0) {
//                NavigationLink("Ir para a tela 01") {
//                    Text("Sou a tela 01")
//                }
//                NavigationLink("Ir para a tela 02") {
//                    Text("Sou a tela 02")
//                }
//            }
//            .padding()
//        }
        
//        NavigationStack {
//            VStack(spacing: 10.0) {
//                NavigationLink("Ir para a tela 01") {
//                    Text("Sou a tela 01")
//                }
//                NavigationLink("Ir para a tela 02") {
//                    Text("Sou a tela 02")
//                }
//            }
//            .padding()
//        }
        
        NavigationStack {
            VStack(spacing: 10.0) {
                NavigationLink("Ir para a tela 01", value: "Sou a tela 01")
                NavigationLink("Ir para a tela 02", value: Color.red)
//                NavigationLink("Ir para a tela 02") {
//                    Text("Sou a tela 02")
//                }
            }
            .navigationDestination(for: String.self, destination: { value in
                Text(value)
            })
            .navigationDestination(for: Color.self, destination: { value in
                ZStack {
                    value
                }
            })
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
