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
    var searchViewController: SearchViewController
    var childCoordinators: [Coordinator] = []

    // MARK: - Life Cycle

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.searchViewController = SearchViewController()
    }

    deinit {
        print("Deinit \(self)")
    }

    // MARK: - Presenters

    func begin() {
        searchViewController.title = NSLocalizedString("Flickr Finder", comment: "Search title")
        let viewModel = SearchListViewModel(webService: WebService())
        searchViewController.viewModel = viewModel
        navigationController.pushViewController(searchViewController, animated: true)
    }

}

