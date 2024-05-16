//
//  ListObject.swift
//  ListApp
//
//  Created by Felipe Hoffmann on 16/05/24.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
}

struct ListObject: View {
    
    var listPeople = [
        Person(name: "Felipe"),
        Person(name: "Juliana"),
        Person(name: "Milk")
    ]
    
    var body: some View {
//        List(listPeople) { person in
//            Text(person.name)
//                .background(Color.red)
//                .listRowBackground(Color.blue)
//        }
        
        List {
            ForEach(listPeople) { person in
                Text(person.name)
            }
            .background(Color.red)
            .listRowBackground(Color.blue)
            
            Button("Olá") {
                print("Clicked!")
            }
        }
    }
}

#Preview {
    ListObject()
}
