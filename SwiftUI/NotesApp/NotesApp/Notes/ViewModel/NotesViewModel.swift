//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 23/05/24.
//

import Foundation

//  @ObservedObject é usado em uma View para reagir a mudanças em um ObservableObject.
//  (Quem escuta)

//  @StateObject é simmilar ao @ObservedObject, mas é responsável pela criação e destruição
//  do objeto observado, sendo mais apropriado para objetos que a view deve possuir. (Também escuta)

//  @Published é utilizado para notificar mudanças em propriedades de um ObservableObject
//  É quem vai gritar e todos vão escutar: StateObject e ObservedObject

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = [] {
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
