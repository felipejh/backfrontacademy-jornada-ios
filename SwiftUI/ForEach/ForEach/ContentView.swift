//
//  ContentView.swift
//  ForEach
//
//  Created by Felipe Hoffmann on 14/05/24.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    
    private var listPerson: [Person] = [
        Person(name: "Felipe", age: 33),
        Person(name: "Juliana", age: 40)
    ]
    
    @State var selectedPosition: Int? = nil
    @State var selectedPersonId: UUID? = nil
    
    var body: some View {
        VStack {
            ForEach(listPerson) { person in
                Group() {
                    Text("Pessoa ID: \(person.id)")
                    Text("Pessoa Nome: \(person.name)")
                }
                .frame(height: 45)
                .background(selectedPersonId == person.id ? Color.red : Color.gray)
                .onTapGesture {
                    selectedPersonId = person.id
                }
//                .padding()
            }
        }
        .padding()
        
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(0..<26) { index in
                    Text("Posição : \(index)")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color.gray)
                }
            }.padding()
        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(0..<26) { index in
                    Text("Posição : \(index)")
                        .padding(10)
                        .frame(height: 45)
                        .background(selectedPosition == index ? Color.red : Color.blue)
                        .onTapGesture {
                            selectedPosition = index
                        }
                }
            }.padding()
        }
        .frame(height: 60)
    }
}

#Preview {
    ContentView()
}
