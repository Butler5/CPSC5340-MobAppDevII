//
//  Parks.swift
//  FinalProject
//
//  Created by Adam Butler on 4/29/24.
//
import SwiftUI

struct Parks: View {
    
    @ObservedObject var parksvm = ParksViewModel()
    @StateObject var noteApp = ParksViewModel()
    @State var note = NoteModel(title: "", notesdata: "")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($noteApp.notes) { $note in
                    NavigationLink {
                        NoteDetail(note: $note)
                    } label: {
                        Text(note.title)
                    }
                }
                Section {
                    NavigationLink {
                        NoteDetail(note: $note)
                    } label: {
                        Text("New note")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                    }
                }
            }
            
        }
        .onAppear {
            noteApp.fetchData()
        }
        .refreshable {
            noteApp.fetchData()
        }
        
        NavigationStack {
            List {
                ForEach(parksvm.parksData) { park in
                    NavigationLink {
                        ParkDetail(park: park)
                    } label: {
                        Text(park.fullName)
                    }
                }
                
            }
            .onAppear() {
                parksvm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Parks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Parks()
    }
}
