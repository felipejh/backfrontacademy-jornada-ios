//
//  AddNotesView.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 24/05/24.
//

import SwiftUI

struct AddNotesView: View {
    
    @ObservedObject var viewModel: NotesViewModel
    @State var note = Note()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("Informe o título", text: $note.title)
            } header: {
                Text("Título")
            }
            
            Section {
                TextEditor(text: $note.content)
            } header: {
                Text("Conteúdo")
            }
            
            Section {
                Button("Salvar") {
                    viewModel.notes.append(note)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    var viewModel = NotesViewModel()
    return AddNotesView(viewModel: viewModel)
}
