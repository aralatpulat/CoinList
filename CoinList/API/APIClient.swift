//
//  APIClient.swift
//  CryptoList
//
//  Created by Aral Atpulat on 2.02.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import Foundation

class APIClient {
    
    var apiEngine: APIEngine
    
    init(_ apiEngine: APIEngine){
        self.apiEngine = apiEngine
    }
    
    func getCoinList(completion: @escaping ([Coin], Error?) -> Void ) {
        let url = URL(string: Endpoints.coinList.buildEndpoint())!

        apiEngine.get(url: url) { (data, error) in
            if let error = error {
                completion([], error)
                return
            }
            
            guard let data = data else {
                completion([], APIError.data)
                return
            }
            
            if let response = try? JSONDecoder().decode([Coin].self, from: data) {
                completion(response, nil)
            } else {
                completion([], APIError.response)
                return
            }
        }
    }
    
    func getCoinDetail(id: String, completion: @escaping (CoinDetail?, Error?) -> Void) {
        let url = URL(string: Endpoints.coinDetail(id: id).buildEndpoint())!
        
        apiEngine.get(url: url) { (data, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, APIError.data)
                return
            }
            
            if let response = try? JSONDecoder().decode([CoinDetail].self, from: data) {

                if response.count > 0 {
                    completion(response[0], nil)
                } else {
                    completion(nil, APIError.response)
                    return
                }
            } else {
                completion(nil, APIError.response)
                return
            }
        }
    }
    
    func getImage(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        apiEngine.get(url: url) { (data, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, APIError.data)
                return
            }
            completion(data, nil)
        }
    }
}
