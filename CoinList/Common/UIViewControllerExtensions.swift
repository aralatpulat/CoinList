//
//  UIControllerViewExtensions.swift
//  CryptoList
//
//  Created by Aral Atpulat on 5.02.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func setLoading(){
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    func removeLoading(){
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
