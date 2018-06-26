//
//  SearchResult.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit
// https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=4df09ecd4fb22d6b29e03658dfbca36f&extras=media&format=json&nojsoncallback=1&api_sig=4ab2e34ace5f6084eaed02698ac8e9b5
class SearchResult {
    var currentPage: Int = 0
    var perPage: Int = 0
    var photo: Photo? = nil
}
