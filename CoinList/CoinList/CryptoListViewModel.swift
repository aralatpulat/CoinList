//
//  CryptoListViewModel.swift
//  CryptoList
//
//  Created by Aral Atpulat on 27.01.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import Foundation

class CryptoListViewModel {
    
    let apiClient: APICLient = APICLient()
    
    func getCoins(completion: @escaping ([Coin]) -> Void ) {
        apiClient.getCoinList{ (data, error) in
            if error == nil {
                completion(data)
            }
        }
    }
}
