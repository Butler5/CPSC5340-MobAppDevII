//
//  ParkImageModel.swift
//  Assignment3
//
//  Created by Adam Butler on 3/30/24.
//

import Foundation

struct ParkImageModel : Codable, Identifiable{
    let id = UUID()
    let credit : String
    let title : String
    let altText : String
    let caption: String
    let url : String
}
