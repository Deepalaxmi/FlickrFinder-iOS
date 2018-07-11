//
//  SearchViewModel.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchListViewModel {

    // MARK: - Variables

    var needsRefresh: Dynamic<Bool> = Dynamic(false) {
        didSet {
            needsRefresh.value = false // Reset Flag
        }
    }

    var searchTerm: String = "" {
        didSet {
            guard searchTerm != "" else { return }
            loadSearchResults(with: searchTerm)
        }
    }

    var viewModels = [SearchResultViewModel]() {
        didSet {
            needsRefresh.value = true
        }
    }

    // MARK: - Fileprivate

    fileprivate let interval: Int = 2
    fileprivate var webService: WebService!
    fileprivate var currentPage: Int = 1

    // MARK: - Lazy Inits

    fileprivate lazy var throttler: Throttler = {
        let requestThrottler = Throttler(seconds: interval)
        return requestThrottler
    }()

    // MARK: - Life Cycle

    init(webService: WebService) {
        self.webService = webService
    }

}

extension SearchListViewModel {

    // MARK: - Networking

    /**
     This method loads the search results and populate the child view models. The requests are throttled to prevent excess requests.

     - parameter query: the search term
     - parameter completion: returns a closure with error and 
     */
    func loadSearchResults(with query: String, completion: (() -> Void)? = nil) {
        throttler.throttle { [weak self] in
            guard let self_ = self else {
                return
            }
            self_.webService.loadSearchResultsServer(searchTerm: query) { (error, searchGroup) in
                if let searchGroup = searchGroup as? SearchGroup, let searchResults = searchGroup.searchResults {
                    var viewModels = [SearchResultViewModel]()
                    for searchResult in searchResults {
                        let viewModel = SearchResultViewModel(searchResult: searchResult)
                        viewModels.append(viewModel)
                    }
                    self_.viewModels = viewModels
                }
            }
        }
    }
}
