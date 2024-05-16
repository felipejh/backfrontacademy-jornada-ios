//
//  ListWithSection.swift
//  ListApp
//
//  Created by Felipe Hoffmann on 16/05/24.
//

import SwiftUI

struct ListWithSection: View {
    var body: some View {
        List {
            Section {
                Text("Minha primeira section")
            }
            
            Section {
                Text("Minha segunda section")
            }
            
            Section("Minha terceira section") {
                Text("Minha terceira section")
                Text("Minha terceira section")
                Text("Minha terceira section")
            }
            
            Section {
                Text("Minha quarta section")
                Text("Minha quarta section")
                Text("Minha quarta section")
                Text("Minha quarta section")
            } header: {
                HeaderView()
            }
            .listRowSeparator(.hidden)
            
        }
//        .listStyle(.plain)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "star")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(.red)
            
//            Spacer().frame(width: 35)
            
            VStack(alignment: .leading) {
                Text("Felipe")
                Text("Hoffmann")
            }
        }
    }
}

#Preview {
    ListWithSection()
}
