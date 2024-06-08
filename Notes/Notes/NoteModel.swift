//
//  NoteModel.swift
//  Notes
//
//  Created by Adam Butler on 4/17/24.
//

import Foundation
import FirebaseFirestoreSwift

struct NoteModel : Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var notesdata: String
}
