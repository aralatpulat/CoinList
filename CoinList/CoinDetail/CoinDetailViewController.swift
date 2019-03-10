//
//  CoinDetailViewController.swift
//  CryptoList
//
//  Created by Aral Atpulat on 27.01.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import UIKit

class CoinDetailViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var lowestPriceLabel: UILabel!
    @IBOutlet weak var highestPriceLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var lowestView: UIView!
    @IBOutlet weak var highestView: UIView!
    @IBOutlet weak var currentView: UIView!
    
    var viewModel: CoinDetailViewModel!
    
    convenience init(viewModel: CoinDetailViewModel){
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        getCoinDetail()
    }
    
    private func getCoinDetail(){
        setLoading()
        viewModel.detailApiCall(completion:  { [weak self]
            (coinDetail) in
            self?.getImage(imgUrl: coinDetail.image)
            DispatchQueue.main.async {
                self?.nameLabel.text = coinDetail.name
                self?.symbolLabel.text = coinDetail.symbol
                self?.lowestPriceLabel.roundFloatPriceToString(coinDetail.dailyLowest)
                self?.highestPriceLabel.roundFloatPriceToString(coinDetail.dailyHighest)
                self?.currentPriceLabel.roundFloatPriceToString(coinDetail.currentPrice)
                self?.rateLabel.setRate(with: coinDetail.priceChangeRate)
                self?.removeLoading()
            }
        })
    }
    
    private func getImage(imgUrl: URL){
        self.setLoading()
        viewModel.fetchImage(url: imgUrl, completion: { [weak self]
            (data) in
            self?.removeLoading()
            DispatchQueue.main.async {
                self?.iconImageView.image = UIImage(data: data)
            }
        })
    }
    
    private func setUI () {
        title = ""
        iconImageView.rounded()
    }
}



