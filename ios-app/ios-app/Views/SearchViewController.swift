 //
//  SearchViewController.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Variables

    var viewModel: SearchListViewModel!
    var collectionView: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSearchController()
        setupConstraints()
        registerSearchCells()
        bind()
    }

    // MARK: - Setup Bindings

    func bind() {
        viewModel.viewModels.bind { [unowned self] _ in self.collectionView.reloadData() }
    }

    // MARK: - Setup Views

    func setupSearchController() {
        let placeholderText = NSLocalizedString("Search Flickr", comment: "Search placeholder text")
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchBar.placeholder = placeholderText
        searchController.searchResultsUpdater = self
        searchController.searchBar.setLightStyleSearchBar()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }

    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .grayBackground
        collectionView.contentInset.top = 8.0
        collectionView.contentInset.left = 8.0
        collectionView.contentInset.right = 8.0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
    }

    func registerSearchCells() {
        collectionView.register(SearchResultsCell.self, forCellWithReuseIdentifier: "SearchResultsCell")
        collectionView.register(UINib(nibName: "SearchResultsCell", bundle: nil), forCellWithReuseIdentifier: "SearchResultsCell")
    }

    func setupConstraints() {
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[collectionView]|", options: [], metrics: nil, views: ["collectionView": collectionView]))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[collectionView]|", options: [], metrics: nil, views: ["collectionView": collectionView]))
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - UISearchResultsUpdating

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchTerm = searchController.searchBar.text else { return }
        viewModel.searchTerm = searchTerm
    }
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.viewModels.value.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let testCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultsCell", for: indexPath) as! SearchResultsCell
        return testCell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
