//
//  UILabelExtensions.swift
//  CryptoList
//
//  Created by Aral Atpulat on 2.02.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setRate(with rate: Float) {
        self.text = String(format: "%.1f", rate) + "%"
        if rate > 0 {
            //return self.textColor = UIColor.green
            return self.textColor = UIColor(red: 0/255, green: 158/255, blue: 115/255, alpha: 1)
        } else {
            //return self.textColor = UIColor.red
            return self.textColor = UIColor(red: 217/255, green: 64/255, blue: 64/255, alpha: 1)
        }
    }
    
    func roundFloatPriceToString(_ price: Float) {
        self.text =  "$" + String(format: "%.6f", price)
    }
}
