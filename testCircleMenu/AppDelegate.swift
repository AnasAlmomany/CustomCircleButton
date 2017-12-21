//
//  AppDelegate.swift
//  testCircleMenu
//
//  Created by Anas Almomany on 12/20/17.
//  Copyright © 2017 Anas Almomany. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var floatingButtonController: FloatingButtonController?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        floatingButtonController = FloatingButtonController()
        
        return true
    }
    func floatingButtonWasTapped() {
        let alert = UIAlertController(title: "Warning", message: "Don't do that!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Sorry…", style: .default, handler: nil)
        alert.addAction(action)
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
