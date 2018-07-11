//
//  SearchGroup.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//


import Foundation
/**
 ## SearchGroup

 This class contains an array of SearchResult objects.
 In the future, if we want to support more SearchResult types other than Photo and want to
 show the results in the same list, we can wrap and create the objects here.

 */
class SearchGroup {
    var searchResults: [SearchResult]?
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
