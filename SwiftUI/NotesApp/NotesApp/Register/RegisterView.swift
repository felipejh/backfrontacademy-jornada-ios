//
//  Register.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 18/05/24.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirm: String = ""
    
    var body: some View {
        ZStack {
            Color(red: 0, green: 0.09, blue: 0.2).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Register")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.bottom, 50)
                
                VStack(spacing: 20) {
                    TextField(text: $email) {
                        Text("E-mail")
                            .foregroundStyle(.gray)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.pinkColor, style: StrokeStyle(lineWidth: 1.5)))
                    
                    TextField(text: $password) {
                        Text("Password")
                            .foregroundStyle(.gray)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.pinkColor, style: StrokeStyle(lineWidth: 1.5)))
                    
                    TextField(text: $passwordConfirm) {
                        Text("Confirm Password")
                            .foregroundStyle(.gray)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.pinkColor, style: StrokeStyle(lineWidth: 1.5)))
                }
                
                Spacer()
                
                Button(action: {
                    print("clicked")
                }, label: {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .foregroundStyle(.white)
                        .background(isButtonDisabled ? Color.pinkColorDisabled : Color.pinkColor)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .font(.system(size: 16, weight: .bold))
                })
                .disabled(isButtonDisabled)
            }
            .padding()
        }
    }
    
    private var isButtonDisabled: Bool {
        return email.isEmpty || password.isEmpty || passwordConfirm.isEmpty
        
    }
}

#Preview {
    NavigationStack {
        RegisterView()
    }
}
