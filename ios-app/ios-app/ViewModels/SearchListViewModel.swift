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
    var title: String? = "Search Results"
    var searchResults = [SearchResult]()

    init(searchResults: [SearchResult]) {
        self.searchResults = searchResults
    }

    init(webService: Webservice) {
        self.webService = webService
    }

}

extension SearchListViewModel {
    func fetch(completion: CompletionObjectHandler = nil) {
//        let url = URL(string: "")
    }
}
