//
//  Dynamic.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import Foundation
/**
## Dynamic<T>

This class is a lightweight single binding for this MVVM implementation, which can be expanded in the future if need be.

*/
class Dynamic<T> {

    typealias Listener = (T) -> Void
    
    // MARK: - Variables

    var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    // MARK: - Life Cycle

    init(_ value: T) {
        self.value = value
    }

    // MARK: - Methods

    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
