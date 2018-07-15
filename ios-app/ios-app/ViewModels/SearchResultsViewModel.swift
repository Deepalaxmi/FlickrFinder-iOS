//
//  SearchResultsViewModel.swift
//  ios-app
//
//  Created by Vincent Chau on 7/3/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

struct SearchResultViewModel {

    // MARK: - Variables

    var title: String?
    var imageURL: URL?

    // MARK: - Life Cycle

    init(searchResult: SearchResult) {
        self.title = searchResult.title
        self.imageURL = searchResult.thumbnailURL
    }

    func fetchCachedImage() -> UIImage? {
        guard let cacheKey = imageURL?.absoluteString else { return nil }
        guard let cachedImage = SearchListViewModel.imageCache.object(forKey: NSString(string: cacheKey)) as? UIImage else { return nil }
        return cachedImage
    }

    func storeImageToCache(image: UIImage) {
        guard let cacheKey = imageURL?.absoluteString else { return }
        SearchListViewModel.imageCache.setObject(image, forKey: NSString(string: cacheKey))
    }

}
