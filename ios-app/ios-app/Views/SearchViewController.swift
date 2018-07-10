 //
//  SearchViewController.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Properties

    var viewModel: SearchListViewModel!
    var collectionView: UICollectionView!

    let searchController = UISearchController(searchResultsController: nil)

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSearchController()
        setupConstraints()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "TestCell")
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
        collectionView.contentInset.top = 16.0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
    }

    func setupConstraints() {
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[collectionView]|", options: [], metrics: nil, views: ["collectionView": collectionView]))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[collectionView]|", options: [], metrics: nil, views: ["collectionView": collectionView]))
        NSLayoutConstraint.activate(constraints)
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("[DEBUG]: \(searchController.searchBar.text)")
        viewModel.searchTerm = searchController.searchBar.text!
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let testCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath)
        testCell.backgroundColor = .green
        return testCell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
