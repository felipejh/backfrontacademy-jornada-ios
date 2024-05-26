//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 18/05/24.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    private var loginViewModel = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            if loginViewModel.getAuthUser() == nil {
                LoginView()
            } else {
                NotesView()
            }
        }
    }
}
