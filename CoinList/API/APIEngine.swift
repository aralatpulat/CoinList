//
//  APIEngine.swift
//  CryptoList
//
//  Created by Aral Atpulat on 2.02.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import Foundation

class APIEngine {
    
    var session: URLSession
    
    init() {
        self.session = URLSession.shared
    }
    
    func get(url: URL, completion: @escaping (Data?, Error?) -> Void){
        let task = session.dataTask(with: url) {
            (data, response, error) in
            completion(data, error)
        }
        task.resume()
    }
}
