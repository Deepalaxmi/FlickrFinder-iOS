//
//  UIImageView+Utilities.swift
//  ios-app
//
//  Created by Vincent Chau on 7/11/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImageFromURL(_ url: URL, placeholderImage: UIImage? = nil) {
        DispatchQueue.global(qos: .default).async { [weak self] in
            guard let self_ = self else { return }
            if let imageData = try? Data(contentsOf: url), let imageFromData = UIImage(data: imageData) {
                mainQueue { self_.image = imageFromData }
            } else {
                mainQueue { self_.image = placeholderImage }
            }
        }
    }
}
