//
//  ViewController.swift
//  CryptoList
//
//  Created by Aral Atpulat on 26.01.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import UIKit

class CryptoListViewController: UIViewController {
    
    @IBOutlet weak var cryptoTableView: UITableView!
    var coins: [Coin] = []
    var viewModel: CryptoListViewModel!
    
    convenience init(viewModel: CryptoListViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Crypto List"
        registerCell()
        apiCall()
    }
    
    private func registerCell(){
        self.cryptoTableView.register(UINib(nibName: "CoinCell", bundle: nil), forCellReuseIdentifier: "CoinCell")
    }
    
    func apiCall(){
        setLoading()
        viewModel.getCoins{ [weak self] (coins) in
            self?.coins = coins
            DispatchQueue.main.async {
                self?.cryptoTableView.reloadData()
                self?.removeLoading()
            }            
        }
    }
}

extension CryptoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let coin = coins[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell") as! CoinCell
        cell.setup(coin: coin)
        cell.priceLabel.textAlignment = .right
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        let id = coins[indexPath.row].id
        let coinDetailViewModel = CoinDetailViewModel()
        let coinDetailViewController = CoinDetailViewController(viewModel: coinDetailViewModel, id: id)
        self.show(coinDetailViewController, sender: nil)
    }
}

extension CryptoListViewController: UITableViewDelegate{}

