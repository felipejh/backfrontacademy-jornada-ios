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
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
