//
//  ContentView.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 27/05/24.
//

import SwiftUI

struct MainView: View {
    @State private  var selection = 1
    
    var body: some View {
        TabView(selection: $selection,
                content:  {
            HomeView()
                .tabItem {
                    Image(selection == 1 ? "home-selected" : "home")
                }.tag(1)
            
            NotificationView()
                .tabItem {
                    Image("addButton")
                }.tag(2)
            
            ProfileView()
                .tabItem {
                    Image(selection == 3 ? "user-selected" : "user")
                }.tag(3)
        })
    }
}

#Preview {
    MainView()
}
