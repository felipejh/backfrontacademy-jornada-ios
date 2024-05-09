//
//  DetailView.swift
//  NavigationStack
//
//  Created by Felipe Hoffmann on 09/05/24.
//

import SwiftUI

struct Detail: Hashable {
    var name: String
    var color: Color
}

struct DetailView: View {
    
    var model: Detail
    
    var body: some View {
        ZStack{
            model.color
            
            Text(model.name)
                .navigationTitle("Sou a tela 1")
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(model: Detail(name: "Essa é a tela 1", color: .red))
    }
}
