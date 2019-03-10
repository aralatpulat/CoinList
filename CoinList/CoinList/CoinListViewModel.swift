//
//  CryptoListViewModel.swift
//  CryptoList
//
//  Created by Aral Atpulat on 27.01.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import Foundation

class CoinListViewModel {
    
    let apiClient: APIClient
    var coins: [Coin] = []
    
    init(_ apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getCoins(completion: @escaping () -> Void ) {
        apiClient.getCoinList{ [weak self] (data, error) in
            if error == nil {
                self?.coins = data
                completion()
            }
        }
    }
    
    func getCoins() -> [Coin] {
        return coins
    }
    
    func getCount() -> Int {
        return coins.count
    }
    
    func getCoin(index: Int) -> Coin? {
        if index < coins.count {
            return coins[index]
        }
        return nil
    }
}
