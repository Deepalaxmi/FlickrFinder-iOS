//
//  SearchGroup.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchGroup {
    var searchResults: [SearchResult]?
    var currentPage: Int?

    init(with dictionary: [String: Any]) {
        if let photosDictionary = dictionary["photos"] as? [String: Any], let photosDictionaryArray = photosDictionary["photo"] as? [[String: Any]] {
            var photos = [Photo]()
            for dictionary in photosDictionaryArray {
                let photo = Photo(with: dictionary)
                photos.append(photo)
            }
            self.searchResults = photos
        }
    }
}
