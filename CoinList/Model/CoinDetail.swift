//
//  CoinDetail.swift
//  CryptoList
//
//  Created by Aral Atpulat on 28.01.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import Foundation


struct CoinDetail: Codable {
    
    var id: String
    var symbol: String
    var name: String
    var image: URL
    var currentPrice: Float
    var dailyHighest: Float
    var dailyLowest: Float
    var priceChange: Float
    var priceChangeRate: Float
    var ath: Float
}

extension CoinDetail {
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case currentPrice = "current_price"
        case dailyHighest = "high_24h"
        case dailyLowest = "low_24h"
        case priceChange = "price_change_24h"
        case priceChangeRate = "price_change_percentage_24h"
        case ath
    }
}

