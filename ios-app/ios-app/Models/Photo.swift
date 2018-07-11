//
//  Photo.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import Foundation

extension Photo: SearchResult {}

class Photo {
    var id: String?
    var ownerID: String?
    var title: String?
    var thumbnailURL: URL?

    init(with dictionary: [String: Any]) {
        if let id = dictionary["id"] as? String {
            self.id = id
        }
        if let ownerID = dictionary["owner"] as? String {
            self.ownerID = ownerID
        }
        if let title = dictionary["title"] as? String {
            self.title = title
        }
        if let thumbnailURLString = dictionary["url_sq"] as? String, let thumbnailURL = URL(string: thumbnailURLString) {
            self.thumbnailURL = thumbnailURL
        }
    }
}
