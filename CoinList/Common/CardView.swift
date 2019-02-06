//
//  CardView.swift
//  CryptoList
//
//  Created by Aral Atpulat on 29.01.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView(){
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 6
        self.layer.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1).cgColor
        
        //MARK: shadow
        //self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 3
    }
}
