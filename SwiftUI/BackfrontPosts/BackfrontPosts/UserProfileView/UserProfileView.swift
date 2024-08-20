//
//  UserProfileView.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 2024-08-18.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    Image("h-1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundStyle(Color.blue)
                        .background(Color.white.clipShape(Circle()))
                        .overlay {
                            Circle().stroke(.white, lineWidth: 3)
                        }
                        .offset(x: 35, y: 30)
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    VStack {
                        Text("235")
                            .font(Font.system(size: 17, weight: .medium))
                        Text("Postagens")
                            .font(.footnote)
                    }
                    
                    VStack {
                        Text("2,8K")
                            .font(Font.system(size: 17, weight: .medium))
                        Text("Seguidores")
                            .font(.footnote)
                    }
                    
                    VStack {
                        Text("3,1K")
                            .font(Font.system(size: 17, weight: .medium))
                        Text("Seguindo")
                            .font(.footnote)
                    }
                }
                
                Spacer()
            }
            
            Text("BackFront Academy")
                .font(Font.system(size: 13, weight: .medium))
                .padding(.top, 5)
            
            Text("Seja o profissional mais procurado e bem remunerado do mercado de tecnologia.")
                .font(Font.system(size: 13, weight: .regular))
                .padding(.top, 1)
            
            HStack(spacing: 8) {
                Group {
                    Button("Editar perfil") {
                        print("tapped profile edit")
                    }
                    Button("Compartilhar perfil") {
                        print("tapped share profile")
                    }
                }
                .font(Font.system(size: 13, weight: .medium))
                .foregroundStyle(.black)
                .frame(height: 35)
                .frame(maxWidth: .infinity) // width - full
                .background(Color.gray.opacity(0.2).clipShape(RoundedRectangle(cornerRadius: 3)))
            }
            .padding(.top, 10)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
    }
}

#Preview {
    UserProfileView()
}
