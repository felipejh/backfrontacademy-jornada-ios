//
//  ListDelete.swift
//  ListApp
//
//  Created by Felipe Hoffmann on 16/05/24.
//

import SwiftUI

struct ListDelete: View {
    
    @State var items = ["Elemento 1", "Elemento 2", "Elemento 3", "Elemento 4", "Elemento 5"]
    
    var body: some View {
//        List {
//            ForEach(items, id: \.self) { value in
//                Text(value)
//                    .deleteDisabled(value == "Elemento 2" ? true : false)
//            }
//            .onDelete(perform: { indexSet in
//                items.remove(atOffsets: indexSet)
//            })
//        }
        
        List($items, id: \.self, editActions: .delete) { $value in
            Text(value)
        }
    }
}

#Preview {
    ListDelete()
}
