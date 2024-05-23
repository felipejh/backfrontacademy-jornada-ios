//
//  ContentView.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 18/05/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var goRegister: Bool = false
    @State private var goNotes: Bool = false
    @State private var isAlertPresented: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                
                VStack(spacing: 25) {
                    Text("Login")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    Group {
                        TextField(text: $email) {
                            Text("E-mail")
                                .foregroundStyle(.gray)
                                .keyboardType(.emailAddress)
                        }
                        
                        SecureField(text: $password) {
                            Text("Password")
                                .foregroundStyle(.gray)
                                .autocorrectionDisabled()
                        }
                        
                    }
                    .textInputAutocapitalization(.never)
                    .frame(height: 40)
                    .padding(7)
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.pinkColor, style: StrokeStyle(lineWidth: 2)))
                    .padding(7)
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
//                        loginUser()
                        goNotes.toggle()
                    }, label: {
                        Text("Login")
                            .frame(width: 180, height: 45)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.white)
                            .background(Color.pinkColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        goRegister.toggle()
                    }, label: {
                        Text("Don't have an account? Register")
                            .frame(height: 45)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.white)
                    })
                    
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
            }
            .alert("Atenttion", isPresented: $isAlertPresented) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
            .navigationDestination(isPresented: $goRegister) {
                RegisterView()
            }
            .navigationDestination(isPresented: $goNotes) {
                NotesView()
            }
        }
    }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                errorMessage = error.localizedDescription
                isAlertPresented.toggle()
            } else {
                goNotes.toggle()
            }
        }
    }
}

#Preview {
    LoginView()
}
