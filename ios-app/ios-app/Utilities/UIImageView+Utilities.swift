//
//  UIImageView+Utilities.swift
//  ios-app
//
//  Created by Vincent Chau on 7/11/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

typealias ImageCompletionHandler = ((UIImage?) -> Void)?

extension UIImageView {
    func setImageFromURL(_ url: URL, defaultImage: UIImage? = nil, completion: ImageCompletionHandler = nil) {
        backgroundQueue { [weak self] in
            guard let self_ = self else { return }
            if let imageData = try? Data(contentsOf: url) {
                mainQueue {
                    self_.image = UIImage(data: imageData) ?? defaultImage
                    completion?(self_.image)
                }
            } else {
                mainQueue { completion?(nil) }
            }
        }
    }
}
