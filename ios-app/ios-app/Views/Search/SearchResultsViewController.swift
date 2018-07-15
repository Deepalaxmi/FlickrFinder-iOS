//
//  SearchResultsViewController.swift
//  ios-app
//
//  Created by Vincent Chau on 7/15/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {

    var viewModel: SearchListViewModel!
	var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
		setupCollectionView()
		setupConstraints()
		registerSearchCells()
		setupBindings()
    }

    // MARK: - Setup Bindings

    func setupBindings() {
        viewModel.needsRefresh.bind { [unowned self] needsRefresh in
            if needsRefresh {
                self.collectionView.reloadData()
            }
        }
    }

	// MARK: - Setup Views

	func setupCollectionView() {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.scrollDirection = .vertical
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		collectionView.delegate = self as? UICollectionViewDelegate
		collectionView.dataSource = self as? UICollectionViewDataSource
		collectionView.backgroundColor = .white
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

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource

extension SearchResultsViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

	}
}

extension SearchResultsViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.viewModels.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let searchResultCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultsCell", for: indexPath) as! SearchResultsCell
		searchResultCell.viewModel = viewModel.viewModels[indexPath.row]
		return searchResultCell
	}
}

extension SearchResultsViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 120, height: 120)
	}
}


