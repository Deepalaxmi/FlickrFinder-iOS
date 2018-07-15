//
//  SearchViewModel.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchListViewModel {

    // MARK: - Static Variables

    static var imageCache = NSCache<NSString, AnyObject>()

    // MARK: - Dynamic Variables

    var needsRefresh: Dynamic<Bool> = Dynamic(false) {
        didSet {
            needsRefresh.value = false // Reset Flag
        }
    }

    var loadError: Dynamic<Error?> = Dynamic(nil)

    // MARK: - Property Observers

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

    fileprivate let interval: Double = 1.5
    fileprivate var webService: WebService!
    fileprivate var searchGroup: SearchGroup?
    fileprivate var canLoadMore: Bool = true

    // MARK: - Lazy Inits

    fileprivate lazy var throttler: Throttler = {
        let requestThrottler = Throttler(seconds: interval)
        return requestThrottler
    }()

    // MARK: - Life Cycle

    init(webService: WebService) {
        self.webService = webService
    }

    // MARK: - Helper Methods

    func loadMoreResults() {

    }

}

extension SearchListViewModel {

    // MARK: - Networking

    /**
     This method loads the search results and populate the child view models. The requests are throttled to prevent excess requests.

     - parameter query: the search term
     - parameter completion: returns a closure with error and 
     */
    func loadSearchResults(with query: String) {
        throttler.throttle { [weak self] in
            guard let self_ = self else {
                return
            }
            self_.webService.loadSearchResultsServer(searchTerm: query) { (error, searchGroup) in
                guard error == nil else {
                    self_.loadError.value = error
                    return
                }
                if let searchGroup = searchGroup as? SearchGroup, let searchResults = searchGroup.searchResults {
                    var viewModels = [SearchResultViewModel]()
                    for searchResult in searchResults {
                        let viewModel = SearchResultViewModel(searchResult: searchResult)
                        viewModels.append(viewModel)
                    }
                    self_.viewModels = viewModels
                    self_.searchGroup = searchGroup
                } else {
                    self_.canLoadMore = false // Loaded last page
                }
            }
        }
    }

    /**
     This method loads more search results with pagination

     - parameter query: the search term
     - parameter query: the current page
     - parameter query: the amount of results for page load
     - parameter completion: returns a closure with error and
     */
    func loadMoreSearchResults(with query: String, page: Int, perPage: Int, completion: (() -> Void)? = nil) {
        webService.loadSearchResultsServer(searchTerm: query, currentPage: page, perPage: perPage) { error, searchResults in
            
        }
    }

}
