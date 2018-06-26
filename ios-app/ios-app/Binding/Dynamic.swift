//
//  Dynamic.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
