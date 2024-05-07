//
//  ContentView.swift
//  ElementsSwiftUI
//
//  Created by Felipe Hoffmann on 07/05/24.
//

import SwiftUI

struct ToogleScreen: View {
    
    @State var isOn: Bool = true
    
    var body: some View {
        ZStack {
            Color(isOn ? .orange : .red)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Toggle(isOn: $isOn) {
                    Text("Teste")
                }
                .background(Color.red)
                
                Toggle("Exemplo", isOn: $isOn)
                .background(Color.red)
                .toggleStyle(.switch)
                
                Toggle("Exemplo", isOn: $isOn)
                .background(Color.red)
                .labelsHidden()
            }
            .padding()
        }
    }
}

#Preview {
    ToogleScreen()
}
