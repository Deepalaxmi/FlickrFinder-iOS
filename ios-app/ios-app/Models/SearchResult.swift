//
//  SearchResult.swift
//  ios-app
//
//  Created by Vincent Chau on 7/11/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import Foundation

protocol SearchResult {
    var id: String? { get set }
    var title: String? { get set }
    var thumbnailURL: URL? { get set }
}

