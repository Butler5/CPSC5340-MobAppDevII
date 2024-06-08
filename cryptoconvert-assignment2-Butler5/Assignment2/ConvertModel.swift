//
//  ConvertModel.swift
//  Assignment2
//
//  Created by Adam Butler on 3/25/24.
//

import Foundation

struct ConvertModel<SomeType> : Identifiable  {
    let id = UUID()
    var isFront : Bool = true
    let cardContent : SomeType
    
}

// Currency
struct CurrencyItemModel {
    let currencyName : String
    let currencyCode : String
    let countryFlag : String
    let multiplier : Double

}

