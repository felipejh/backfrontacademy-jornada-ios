//
//  Note.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 23/05/24.
//

import Foundation

struct Note: Identifiable {
    var id: UUID = UUID()
    
    var title: String = ""
    var content: String = ""
}
