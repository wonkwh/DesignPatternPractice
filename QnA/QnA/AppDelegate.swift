//
//  AppDelegate.swift
//  QnA
//
//  Created by wonkwh on 03/12/2018.
//  Copyright © 2018 wonkwh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
//        window?.rootViewController = QueryController()
        window?.rootViewController = UINavigationController(rootViewController: SelectQueryGroupController())
        return true
    }
}

