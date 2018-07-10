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

    var searchTerm: String = "" {
        didSet {
            loadSearchResults(with: searchTerm)
        }
    }

    var searchResults = [SearchResult]()

    init(searchResults: [SearchResult]) {
        self.searchResults = searchResults
    }

    init(webService: Webservice) {
        self.webService = webService
    }

}

extension SearchListViewModel {
    func loadSearchResults(with query: String, completion: CompletionObjectHandler = nil) {
        webService.loadSearchResultsServer(searchTerm: query, extraParameters: nil) { (error, json) in
            print("[DEBUG]: error: \(error) json \(json)")
        }
    }

    func loadFromServer(completion: CompletionObjectHandler = nil) {
        // https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=4df09ecd4fb22d6b29e03658dfbca36f&extras=media&format=json&nojsoncallback=1&api_sig=4ab2e34ace5f6084eaed02698ac8e9b5
    }
}
