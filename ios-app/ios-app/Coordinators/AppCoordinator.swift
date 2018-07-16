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
        showHomeViewController() // Show first view
    }

    func showHomeViewController() {
		let homeViewController = HomeViewController()
		homeViewController.title = NSLocalizedString("Home", comment: "Search title")
		navigationController.pushViewController(homeViewController, animated: true)
    }

	func showDetailViewController(viewModel: SearchResultViewModel) {
		let detailViewController = SearchDetailViewController()
		detailViewController.viewModel = viewModel
		detailViewController.title = NSLocalizedString("Detail", comment: "Search title")
		navigationController.pushViewController(detailViewController, animated: true)
	}

}

// MARK: - UIViewController + AppCoordinator

extension UIViewController {
	weak var appCoordinator: AppCoordinator? {
		return (UIApplication.shared.delegate as? AppDelegate)?.appCoordinator
	}
}
