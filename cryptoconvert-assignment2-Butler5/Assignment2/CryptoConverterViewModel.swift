//
//  CryptoConverterViewModel.swift
//  Assignment2
//
//  Created by Adam Butler on 3/25/24.
//

import Foundation

class CryptoConverterViewModel: ObservableObject {
    
    struct Crypto {
        let cryptoName: String
        let cryptoLabel: String
        let priceInUSD: Double
    }
    
    @Published var cryptos: [Crypto] = [
        Crypto(cryptoName: "Bitcoin", cryptoLabel: "US Dollar", priceInUSD: 23450.00),
        Crypto(cryptoName: "Ethereum", cryptoLabel: "Ethereum", priceInUSD: 14.30),
        Crypto(cryptoName: "Tether", cryptoLabel: "Tether", priceInUSD: 23450.00),
        Crypto(cryptoName: "BNB", cryptoLabel: "BNB", priceInUSD: 77.20),
        Crypto(cryptoName: "USD Coin", cryptoLabel: "USD Coin", priceInUSD: 23454.00),
        Crypto(cryptoName: "XRP", cryptoLabel: "XRP", priceInUSD: 62113.00),
    ]
    
    func convertToUSD(cryptoName: Crypto, amount: Double) -> Double {
        return amount * cryptoName.priceInUSD
    }
}
