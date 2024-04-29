//
//  NoteModel.swift
//  FinalProject
//
//  Created by Adam Butler on 4/29/24.
//

import Foundation
import FirebaseFirestoreSwift

struct NoteModel : Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var notesdata: String
}
