//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 23/05/24.
//

import Foundation

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = [
        Note(title: "Título", content: "Descrição do conteúdo")
    ]
}
