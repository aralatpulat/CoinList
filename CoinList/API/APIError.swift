//
//  APIError.swift
//  CryptoList
//
//  Created by Aral Atpulat on 2.02.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import Foundation

enum APIError: String, Error {
    case data = "The data is invalid"
    case response = "The response is invalid"
}
