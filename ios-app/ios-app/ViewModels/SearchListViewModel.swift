//
//  SearchViewModel.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchListViewModel {
    fileprivate var webService: Webservice!
    fileprivate let interval: Int = 1

    fileprivate lazy var throttler: RequestThrottler? = {
        let requestThrottler = RequestThrottler(seconds: interval)
        return requestThrottler
    }()

    var searchTerm: String = "" {
        didSet {
            loadSearchResults(with: searchTerm)
        }
    }

    var searchResults = [SearchResult]()

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
           self_.webService.loadSearchResultsServer(searchTerm: query, extraParameters: nil) { (error, json) in
                print("[DEBUG]: error: \(error) json \(json)")
            }
        }
    }
}
