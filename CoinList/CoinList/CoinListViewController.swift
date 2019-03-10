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
        viewModel.getCoins { [weak self] () in
            DispatchQueue.main.async {
                self?.coinTableView.reloadData()
                self?.removeLoading()
            }            
        }
    }
}

extension CoinListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell") as! CoinCell
        
        if let coin = viewModel.getCoin(index: indexPath.row) {
            cell.setup(coin: coin)
            cell.priceLabel.textAlignment = .right
        }        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let coin = viewModel.getCoin(index: indexPath.row) {
            let id = coin.id
            coordinator?.openCoinDetail(of: id, vc: self)
        }
    }
}

extension CoinListViewController: UITableViewDelegate{}

