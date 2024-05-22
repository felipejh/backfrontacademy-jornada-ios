//
//  Register.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 18/05/24.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirm: String = ""
    @State private var isAlertPresented: Bool = false
    @State private var goNotes: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            
            VStack(spacing: 25) {
                Text("Register")
                    .font(.system(size: 55, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.top, 5)
                    .padding(.bottom, 50)
                
                
                Group {
                    TextField(text: $email) {
                        Text("E-mail")
                            .foregroundStyle(.gray)
                    }
                    
                    SecureField(text: $password) {
                        Text("Password")
                            .foregroundStyle(.gray)
                    }
                    
                    SecureField(text: $passwordConfirm) {
                        Text("Confirm Password")
                            .foregroundStyle(.gray)
                    }
                    
                }
                .frame(height: 40)
                .padding(7)
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.pinkColor, style: StrokeStyle(lineWidth: 1.5)))
                .padding(7)
                .foregroundColor(.white)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                
                Spacer()
                
                Button(action: {
                    registerUser()
                }, label: {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .foregroundStyle(.white)
                        .background(isButtonDisabled ? Color.pinkColor.opacity(0.6) : Color.pinkColor)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .font(.system(size: 18, weight: .bold))
                })
                .disabled(isButtonDisabled)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 50)
        }
        .alert("Atenttion", isPresented: $isAlertPresented) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(errorMessage)
        }
        .navigationDestination(isPresented: $goNotes) {
            NotesView()
        }

    }
    
    private var isButtonDisabled: Bool {
        return email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || passwordConfirm.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        
    }
    
    private func registerUser() {
        if password == passwordConfirm {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error {
                    errorMessage = error.localizedDescription
                    isAlertPresented.toggle()
                } else {
                    goNotes.toggle()
                }
            }
        } else {
            errorMessage = "Check password and confimf password and try again."
            isAlertPresented.toggle()
        }
        
        
    }
}

#Preview {
    NavigationStack {
        RegisterView()
    }
}
