//
//  Navigation.swift
//  SimpleNavigation
//
//  Created by Felipe Hoffmann on 07/05/24.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        NavigationView {
            NavigationLink("Ir para a tela 02") {
                Tela02()
            }
            .navigationTitle("Tela 01")
        }
    }
}

struct Tela02: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text("Tela 02")
            Button("Voltar") {
                dismiss()
            }
        }
        .navigationTitle("Tela 02")
    }
}

#Preview {
    Navigation()
}
