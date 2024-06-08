//
//  CryptoConvertModel.swift
//  Assignment2
//
//  Created by Adam Butler on 3/25/24.
//

import Foundation

struct CryptoConvertModel<SomeType> : Identifiable  {
    let id = UUID()
    var name: String
    var priceInUSD: Double
}

struct Crypto {
    let cryptoName: String
    let priceInUSD: Double
}
