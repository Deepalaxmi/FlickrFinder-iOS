//
//  SearchResultsViewModel.swift
//  ios-app
//
//  Created by Vincent Chau on 7/3/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import Foundation

class SearchResultViewModel {

    var title: String?
    var imageURL: URL?

    init(searchResult: SearchResult) {
        self.title = searchResult.title
        self.imageURL = searchResult.thumbnailURL
    }

}
