//
//  SearchViewModel.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchListViewModel {
    var searchTerm: String = "" {
        didSet {
            guard searchTerm != "" else { return }
            loadSearchResults(with: searchTerm)
        }
    }

    fileprivate let interval: Int = 2
    fileprivate var webService: Webservice!
    fileprivate var currentPage: Int = 1

    fileprivate lazy var throttler: Throttler? = {
        let requestThrottler = Throttler(seconds: interval)
        return requestThrottler
    }()

    init(webService: Webservice) {
        self.webService = webService
    }
}

extension SearchListViewModel {
    func loadSearchResults(with query: String, completion: CompletionObjectHandler = nil) {
        guard let throttler = self.throttler else {
            completion?(nil, nil)
            return
        }
        throttler.throttle { [weak self] in
            guard let self_ = self else {
                completion?(nil, nil)
                return
            }
            self_.webService.loadSearchResultsServer(searchTerm: query, extraParameters: nil) { (error, searchResult) in
                if let searchResult = searchResult as? SearchResult {
                    
                }
            }
        }
    }
}
