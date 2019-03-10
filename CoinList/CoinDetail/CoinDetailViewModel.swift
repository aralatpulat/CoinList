//
//  CoinDetailViewModel.swift
//  CryptoList
//
//  Created by Aral Atpulat on 27.01.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import Foundation

class CoinDetailViewModel{
    
    let apiClient: APIClient
    private let id: String
    
    init(_ apiClient: APIClient, id: String) {
        self.apiClient = apiClient
        self.id = id
    }
    
    func detailApiCall(completion: @escaping (CoinDetail) -> () ) {
        apiClient.getCoinDetail(id: id) { (data, error) in
            if let data = data {
                completion(data)
            }
        }
    }
    
    func fetchImage(url: URL, completion: @escaping (Data) -> () ) {
        apiClient.getImage(url: url) { (data, error) in
            if let data = data {
                completion(data)
            }
        }
    }
}
