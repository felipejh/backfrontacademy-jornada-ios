//
//  ContentView.swift
//  ListApp
//
//  Created by Felipe Hoffmann on 16/05/24.
//

import SwiftUI

struct ListBasic: View {
    
    var items = ["Elemento 1", "Elemento 2", "Elemento 3"]
    
    var body: some View {
//        List {
//            Text("Elemento 1")
//            Text("Elemento 2")
//            Text("Elemento 3")
//        }
        
        List(items, id: \.self) { value in
            Text(value)
        }
    }
}

#Preview {
    ListBasic()
}
