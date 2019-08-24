//
//  AppDelegate.swift
//  PaymentApp
//
//  Created by Renan Trapp on 24/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let selctAccountRouter = UINavigationController(rootViewController: SelectAccountRouter.OpenSceneSelectAccount())
        
        window?.rootViewController = selctAccountRouter
        window?.makeKeyAndVisible()
        
        return true
    }
}

