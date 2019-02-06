//
//  Endpoints.swift
//  CryptoList
//
//  Created by Aral Atpulat on 5.02.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import Foundation

enum Endpoints {
    case coinList
    case coinDetail(id: String)
    
    func buildEndpoint() -> String {
        switch self {
        case .coinList:
            return Constants.API.BASE_URL + "?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h"
        case .coinDetail(let id):
            return Constants.API.BASE_URL + "?vs_currency=usd&ids=" + id
        }
    }
}
