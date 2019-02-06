//
//  UIImageExtensions.swift
//  CryptoList
//
//  Created by Aral Atpulat on 5.02.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func rounded(){
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
