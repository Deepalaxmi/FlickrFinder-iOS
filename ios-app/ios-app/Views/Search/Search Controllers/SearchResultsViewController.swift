//
//  SearchResultsViewController.swift
//  ios-app
//
//  Created by Vincent Chau on 7/15/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {
	
    // MARK: - Variables

    var viewModel: SearchListViewModel!

    // MARK: - Private

    private var collectionView: UICollectionView!

    // MARK: - View Life Cycle

    override func viewDidLoad() {
    	super.viewDidLoad()
	setupCollectionView()
	setupConstraints()
	registerSearchCells()
	setupBindings()
    }

    // MARK: - Setup Bindings

    func setupBindings() {
        viewModel.needsRefresh.bind { [weak self] needsRefresh in
            if needsRefresh {
                self?.collectionView.reloadData()
            }
        }
        viewModel.loadError.bind { [weak self] error in
	    self?.presentAlertForError(with: error)
        }
    }

    // MARK: - Setup Views

    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
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

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offset = UIScreen.main.bounds.height
	    let endScrolling = scrollView.contentOffset.y + scrollView.frame.size.height
	    if endScrolling >= scrollView.contentSize.height - offset {
	        viewModel.loadMoreResults()
    	}
    }
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource

extension SearchResultsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let searchResultViewModel = viewModel.viewModels?[indexPath.row] else { return }
        appCoordinator?.showDetailViewController(viewModel: searchResultViewModel)
    }
}

extension SearchResultsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.viewModels?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let searchResultCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultsCell", for: indexPath) as! SearchResultsCell
        guard let childViewModel = viewModel?.viewModels?[indexPath.row] else { return searchResultCell }
        searchResultCell.viewModel = childViewModel
        return searchResultCell
    }
}

extension SearchResultsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isLandscape = UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation)
        let cellPadding: CGFloat = 16.0
        let cellWidth = (isLandscape ? (collectionView.frame.size.width / 5.0) : (collectionView.frame.size.width / 2.0)) - cellPadding
        let cellHeight = cellWidth * 1.5
        return CGSize(width: cellWidth, height: cellHeight)
    }
}


