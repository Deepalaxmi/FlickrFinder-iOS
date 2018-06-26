//
//  SearchCoordinator.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchCoordinator: Coordinator {

    // MARK: - Properties

    var navigationController: UINavigationController
    var searchListViewController: SearchListViewController
    var childCoordinators: [Coordinator] = []


    // MARK: - Life Cycle

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.searchListViewController = SearchListViewController()
    }

    // MARK: - Presenters

    func begin() {
        navigationController.pushViewController(searchListViewController, animated: true)
    }

}

