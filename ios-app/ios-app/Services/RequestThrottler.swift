//
//  RequestThrottler.swift
//  ios-app
//
//  Created by Vincent Chau on 7/3/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class RequestThrottler {
    private let backgroundQueue = DispatchQueue.global(qos: .background)
    private var pendingWorkItem: DispatchWorkItem = DispatchWorkItem(block: {})
    private var lastJobDate: Date = Date.distantPast
    private var interval: Int

    init(seconds: Int) {
        self.interval = seconds
    }

    func throttle(block: @escaping ()->()) {
        pendingWorkItem.cancel()
        pendingWorkItem = DispatchWorkItem() { [weak self] in
            self?.lastJobDate = Date()
            block()
        }
        let delay = Int(Date().timeIntervalSince(lastJobDate).rounded()) > interval ? 0 : interval
        backgroundQueue.asyncAfter(deadline: .now() + Double(delay), execute: pendingWorkItem)
    }
}
