//
//  ViewController.swift
//  CoinList
//
//  Created by Aral Atpulat on 26.01.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import UIKit

class CoinListViewController: UIViewController {
    
    @IBOutlet weak var coinTableView: UITableView!
    var coins: [Coin] = []
    var viewModel: CoinListViewModel!
    var coordinator: Coordinator?
    
    convenience init(viewModel: CoinListViewModel) {
        self.init()
        self.viewModel = viewModel
        self.coordinator = Coordinator()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Coin List"
        registerCell()
        apiCall()
    }
    
    private func registerCell(){
        self.coinTableView.register(UINib(nibName: "CoinCell", bundle: nil), forCellReuseIdentifier: "CoinCell")
    }
    
    func apiCall(){
        setLoading()
        viewModel.getCoins{ [weak self] (coins) in
            self?.coins = coins
            DispatchQueue.main.async {
                self?.coinTableView.reloadData()
                self?.removeLoading()
            }            
        }
    }
}

extension CoinListViewController: UITableViewDataSource {
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
        coordinator?.openCoinDetail(of: id, vc: self)
    }
}

extension CoinListViewController: UITableViewDelegate{}

