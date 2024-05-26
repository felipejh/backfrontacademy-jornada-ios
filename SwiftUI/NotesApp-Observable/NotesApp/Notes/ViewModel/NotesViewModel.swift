//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 23/05/24.
//

import Foundation

@Observable
class NotesViewModel {
    var notes: [Note] = [] {
        didSet {
            saveNote()
        }
    }
    
    init() {
        guard let getSavedNotes = UserDefaults.standard.data(forKey: "notes") else { return }
        if let parsedNotes = try? JSONDecoder().decode([Note].self, from: getSavedNotes) {
            notes = parsedNotes
        }
    }
    
    func saveNote() {
        if let encodedNotes = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encodedNotes, forKey: "notes")
        }
    }
}
