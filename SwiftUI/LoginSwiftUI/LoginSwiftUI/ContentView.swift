//
//  ContentView.swift
//  LoginSwiftUI
//
//  Created by Felipe Hoffmann on 04/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Login")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold))
                
                Image("LOGO")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                VStack(spacing: 15){
                    TextField("E-mail", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .background(Color.white)
                        .foregroundStyle(Color.black)
                        .keyboardType(.emailAddress)
                        .cornerRadius(4)
                    
                    SecureField("Senha", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .background(Color.white)
                        .foregroundStyle(Color.black)
                        .cornerRadius(4)
                    
                    Button(action: {
                        print("Click button")
                    }, label: {
                        Text("Login")
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                            .background(Color(red: 228/255, green: 50/255, blue: 128/255))
                            .cornerRadius(8)
                    })
                    
                    HStack {
                        Text("Não tem conta?")
                            .foregroundStyle(Color.white)
                        Button {
                            print("Sem conta clicked")
                        } label: {
                            Text("Cadastre-se")
                                .foregroundStyle(Color(red: 228/255, green: 50/255, blue: 128/255))
                                .font(.system(size: 18, weight: .semibold))
                        }

                    }
                }
                .padding(.horizontal, 20)

                Spacer()
                
            }
        }
    }
}

#Preview {
    ContentView()
}
