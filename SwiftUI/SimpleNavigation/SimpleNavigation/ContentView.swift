//
//  ContentView.swift
//  SimpleNavigation
//
//  Created by Felipe Hoffmann on 05/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            
            Button("Apresentar modal") {
                isPresented = true
            }
            .sheet(isPresented: $isPresented, content: {
                SheetView()
            })

        }
        .padding()
    }
}

struct SheetView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: 20.0) {
                Text("Alooooouuu")
                Button("Abrir segunda modal") {
                    isPresented = true
                }
                .fullScreenCover(isPresented: $isPresented, content: {
                    AnotherModal()
                })
                Button("Fechar essa modal") {
                    dismiss()
                }
            }
        }
    }
}

struct AnotherModal: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            Color.red.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Segunda modal!")
                Button("Fechar terceira modal") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
