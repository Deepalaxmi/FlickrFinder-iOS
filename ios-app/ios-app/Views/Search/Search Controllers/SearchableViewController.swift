 //
//  SearchViewController.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchableViewController: UIViewController {

    // MARK: - Private

    private weak var _searchController: UISearchController?
    private weak var _searchResultsViewController: SearchResultsViewController?

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeSearchControllers()
    }

    // MARK: - Setup Views

    func initializeSearchControllers() {
        let searchResultsViewController = SearchResultsViewController()
        searchResultsViewController.viewModel = SearchListViewModel(webService: WebService())
        let searchController = UISearchController(searchResultsController: searchResultsViewController)
        _searchResultsViewController = searchResultsViewController
        _searchController = searchController
        let placeholderText = NSLocalizedString("Search Images", comment: "Search placeholder text")
        searchController.searchBar.placeholder = placeholderText
        searchController.searchResultsUpdater = self
        searchController.searchBar.updateToLightStyleSearchBar()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
}

 // MARK: - UISearchResultsUpdating

extension SearchableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
		guard let searchResultsController = searchController.searchResultsController as? SearchResultsViewController else { return }
		guard let searchTerm = searchController.searchBar.text else { return }
		searchResultsController.viewModel.searchTerm = searchTerm
    }
}
