//
//  Coin.swift
//  CryptoList
//
//  Created by Aral Atpulat on 26.01.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import Foundation

struct Coin: Codable {
    var id: String
    var symbol: String
    var name: String
    var image: String
    var currentPrice: Float
    var priceChange: Float

    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case currentPrice = "current_price"
        case priceChange = "price_change_percentage_24h_in_currency"
    }
}
