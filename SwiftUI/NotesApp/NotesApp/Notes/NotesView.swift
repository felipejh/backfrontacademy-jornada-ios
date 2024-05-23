//
//  NotesView.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 20/05/24.
//

import SwiftUI

struct NotesView: View {
    
    @StateObject var viewModel = NotesViewModel()
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        List($viewModel.notes, editActions: .all) { $note in
            Text(note.title)
            Text(note.content)
        }
    }
}

#Preview {
    NavigationStack {
        NotesView()
    }
}
