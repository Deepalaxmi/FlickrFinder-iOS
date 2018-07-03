//
//  AppCoordinator.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {

    // MARK: - Properties

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    // MARK: - Life Cycle

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    deinit {
        print("Deinit \(self)")
    }

    // MARK: - Presenters

    func begin() {
        showSearchViewController() // Show first view
    }

    func showSearchViewController() {
        let searchCoordinator = SearchCoordinator(with: navigationController)
        childCoordinators.append(searchCoordinator)
        searchCoordinator.begin()
    }

}
