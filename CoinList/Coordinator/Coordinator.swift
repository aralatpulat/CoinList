//
//  Coordinator.swift
//  CoinList
//
//  Created by Aral Atpulat on 10.02.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import Foundation
import UIKit

class Coordinator{
    
    let apiEngine: APIEngine
    let apiClient: APIClient
    var rootViewController: UINavigationController!
    
    init() {
        apiEngine = APIEngine()
        apiClient = APIClient(apiEngine);
    }
    
    func openCoinList(window: UIWindow?){
        let viewModel = CoinListViewModel(apiClient)
        rootViewController = UINavigationController(rootViewController: CoinListViewController(viewModel: viewModel))
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    
    func openCoinDetail(of coinId: String, vc: CoinListViewController){
        let coinDetailViewModel = CoinDetailViewModel(apiClient)
        let coinDetailViewController = CoinDetailViewController(viewModel: coinDetailViewModel, id: coinId)
        vc.show(coinDetailViewController, sender: nil)
    }
}
