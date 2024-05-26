//
//  NotesView.swift
//  NotesApp
//
//  Created by Felipe Hoffmann on 20/05/24.
//

import SwiftUI

//  @ObservedObject é usado em uma View para reagir a mudanças em um ObservableObject.
//  (Quem escuta)

//  @StateObject é simmilar ao @ObservedObject, mas é responsável pela criação e destruição
//  do objeto observado, sendo mais apropriado para objetos que a view deve possuir. (Também escuta)

//  @Published é utilizado para notificar mudanças em propriedades de um ObservableObject
//  É quem vai gritar e todos vão escutar: StateObject e ObservedObject

struct NotesView: View {
    
    @State var viewModel = NotesViewModel()
    @State var isGoAddNote: Bool = false
    @Environment(\.dismiss) var dismiss
    private var loginViewModel = LoginViewModel()
    private var loggedUser: AuthUser?
    
    var body: some View {
        NavigationStack {
            List($viewModel.notes, editActions: .all) { $note in
                NavigationLink {
                    NotesDetailView(note: $note)
                } label: {
                    HStack {
                        Image(systemName: "pencil")
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 8)
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.content)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("Notas")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Adicionar") {
                        isGoAddNote.toggle()
                    }
                }
                            ToolbarItem(placement: .topBarLeading) {
                                Button("Sair do App: \(userEmail)") {
                                    UserDefaults.standard.removeObject(forKey: "auth")
                                    dismiss()
                                }
                            }
            }
            //        .navigationDestination(isPresented: $isGoAddNote) {
            //            Color.blue
            //        }
            .sheet(isPresented: $isGoAddNote, content: {
                AddNotesView(viewModel: viewModel)
            })
        }
    }
    
    var userEmail: String {
        let loggedUser = loginViewModel.getAuthUser()
        
        return loggedUser?.email ?? ""
    }
}

#Preview {
    NavigationStack {
        NotesView()
    }
}
