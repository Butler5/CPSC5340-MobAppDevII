//
//  ParksViewModel.swift
//  FinalProject
//
//  Created by Adam Butler on 4/29/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class ParksViewModel : ObservableObject {
    
    @Published private(set) var parksData = [ParkModel]()
    private let url = "https://developer.nps.gov/api/v1/parks?limit=20&api_key=8e6Pi3pbwXIYBxsBfNO9ZxcpfjN0ZtOUwyu1bHOW"
    
    @Published var notes = [NoteModel]()
    let db = Firestore.firestore()

    
    func fetchData() {
        if let url = URL(string: url) {
            URLSession
                .shared
                .dataTask(with: url) {(data, response, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let data = data {
                            do {
                                let results = try JSONDecoder().decode(ParkResults.self, from: data)
                                self.parksData = results.data
                            } catch {
                                print(error)
                            }
                        }
                    }
                }.resume()
        }
        
        self.notes.removeAll()
       db.collection("notes")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.notes.append(try document.data(as: NoteModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
        }
        
    }
    
    func saveData(note: NoteModel) {
        
        
        if let id = note.id {
            if !note.title.isEmpty || !note.notesdata.isEmpty {
                let docRef = db.collection("notes").document(id)
                
                docRef.updateData([
                    "title": note.title,
                    "notesdata" : note.notesdata
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
            }
        } else {
            
            if !note.title.isEmpty || !note.notesdata.isEmpty {
                var ref: DocumentReference? = nil
                ref = db.collection("notes").addDocument(data: [
                    "title": note.title,
                    "notesdata": note.notesdata
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
        }
    }
}

