//
//  ContactModel.swift
//  Assignment3
//
//  Created by Adam Butler on 3/30/24.
//

import Foundation

struct ContactModel: Codable {
    let phoneNumbers : [PhoneModel]
    let emailAddresses : [EmailModel]
}

struct PhoneModel: Codable {
    let phoneNumber : String
    let description : String
    let `extension` : String
    let type : String
}

struct EmailModel: Codable {
    let description : String
    let emailAddress : String
}
