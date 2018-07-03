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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let coordinator = AppCoordinator(with: navigationController)
        appCoordinator = coordinator
        window?.rootViewController = appCoordinator?.navigationController
        coordinator.begin()
        window?.makeKeyAndVisible()
        configureAppearance()
        return true
    }

    func configureAppearance() {
        UINavigationBar.appearance().barTintColor = .flickrBlue
        UINavigationBar.appearance().tintColor = .flickrBlue
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: AppFonts.AvenirHeavy20]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: AppFonts.AvenirHeavy28]

        UISearchBar.appearance().searchBarStyle = .prominent
        UISearchBar.appearance().tintColor = .white
        UISearchBar.appearance().barTintColor = .white
    }

}

