//
//  Throttler.swift
//  ios-app
//
//  Created by Vincent Chau on 7/3/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class Throttler {

    // MARK: - Variables

    fileprivate let backgroundQueue = DispatchQueue.global(qos: .background)
    fileprivate var pendingWorkItem: DispatchWorkItem = DispatchWorkItem(block: {})
    fileprivate var lastJobDate: Date = Date.distantPast
    fileprivate var interval: Int

    // MARK: - Life Cycle

    init(seconds: Int) {
        self.interval = seconds
    }

    // MARK: - Methods

    func throttle(block: @escaping () -> ()) {
        pendingWorkItem.cancel()
        pendingWorkItem = DispatchWorkItem() { [weak self] in
            self?.lastJobDate = Date()
            block()
        }
        let delay = Int(Date().timeIntervalSince(lastJobDate).rounded()) > interval ? 0 : interval
        backgroundQueue.asyncAfter(deadline: .now() + Double(delay), execute: pendingWorkItem)
    }
}
