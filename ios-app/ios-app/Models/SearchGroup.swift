//
//  SearchGroup.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//


import Foundation

/**
## Search Group
 Right now this class is a wrapper for Photos but can be used for other SearchResult types we wish to support in the future. Like Events, Groups.
*/
class SearchGroup {
    var searchResults: [SearchResult]?
    var page: Int?
    var perPage: Int?

    init(with dictionary: [String: Any]) {
        if let photosDictionary = dictionary["photos"] as? [String: Any], let photosDictionaryArray = photosDictionary["photo"] as? [[String: Any]] {
            if let page = photosDictionary["page"] as? Int {
                self.page = page
            }
            if let perPage = photosDictionary["perpage"] as? Int {
                self.perPage = perPage
            }
            var photos = [Photo]()
            for dictionary in photosDictionaryArray {
                let photo = Photo(with: dictionary)
                photos.append(photo)
            }
            self.searchResults = photos
        }
    }
}
