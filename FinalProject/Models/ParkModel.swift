//
//  ParkModel.swift
//  FinalProject
//
//  Created by Adam Butler on 4/29/24.
//

import Foundation

struct ParkResults: Codable {
    let total : String
    let limit : String
    let start : String
    let data : [ParkModel]
}

struct ParkModel: Codable, Identifiable {
    let id: String
    let fullName: String
    let description: String
    let latitude: String
    let longitude: String
    let contacts : ContactModel
    let addresses : [AddressModel]
    let images : [ParkImageModel]
}
