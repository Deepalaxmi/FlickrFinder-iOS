//
//  AppDelegate.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let coordinator = AppCoordinator(with: UINavigationController())
        appCoordinator = coordinator
        window?.rootViewController = appCoordinator?.navigationController
        coordinator.begin()
        window?.makeKeyAndVisible()
        return true
    }

}

