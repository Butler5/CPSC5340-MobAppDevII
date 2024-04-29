//
//  AddressModel.swift
//  Assignment3
//
//  Created by Adam Butler on 3/30/24.
//

import Foundation

struct AddressModel : Codable, Identifiable {
    var id : UUID {
        return UUID()
    }
    let postalCode : String
    let city : String
    let stateCode : String
    let line1 : String
    let type : String
    let line3 : String
    let line2 : String
}
