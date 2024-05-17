//
//  ContentView.swift
//  Form
//
//  Created by Felipe Hoffmann on 17/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var feedback: String = ""
    @State var rate: Float = 5
    
    var isDisabledButton: Bool {
        return name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundStyle(.gray)
                        TextField("Nome", text: $name)
                    }
                    
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundStyle(.gray)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                    }
                } header: {
                    Text("Informações pessoais")
                }
                
                Section {
                    ZStack {
                        if feedback.isEmpty {
                            Text("Digite seu feedback aqui")
                                .foregroundStyle(.gray)
                        }
                        TextEditor(text: $feedback)
                    }
                } header: {
                    Text("Informe seu feedback")
                }
                
                Section {
                    HStack {
                        Text("1")
                        Slider(value: $rate, in: 1...10, step: 1)
                        Text("10")
                        
                        Spacer().frame(width: 20)
                        
                        Text("Nota: \(Int(rate))")
                    }
                } header: {
                    Text("Nota")
                }
                
                Section {
                    Button(action: {
                        print("Clicked")
                    }, label: {
                        Text("Enviar feedback")
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .foregroundStyle(.white)
                            .background(isDisabledButton ? Color.gray : Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .disabled(isDisabledButton)
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
