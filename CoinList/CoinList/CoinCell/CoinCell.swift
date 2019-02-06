//
//  CoinCell.swift
//  CryptoList
//
//  Created by Aral Atpulat on 26.01.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import UIKit

class CoinCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    func setup(coin: Coin){
        nameLabel.text = coin.name
        priceLabel.roundFloatPriceToString(coin.currentPrice)
        symbolLabel.text = coin.symbol
        rateLabel.setRate(with: coin.priceChange)
    }
}
