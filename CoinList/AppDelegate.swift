//
//  AppDelegate.swift
//  CryptoList
//
//  Created by Aral Atpulat on 26.01.2019.
//  Copyright © 2019 Aral Atpulat. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootViewController: UINavigationController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewModel = CryptoListViewModel()
        rootViewController = UINavigationController(rootViewController: CryptoListViewController(viewModel: viewModel))
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }
}

