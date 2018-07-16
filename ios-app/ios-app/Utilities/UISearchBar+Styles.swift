//
//  UISearchBar+Styles.swift
//  ios-app
//
//  Created by Vincent Chau on 7/3/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

extension UISearchBar {
    func updateToLightStyleSearchBar() {
        tintColor = .white
        barTintColor = .white
        setLightStyleTextField()
    }

    private func setLightStyleTextField() {
        guard let textField = value(forKey: "searchField") as? UITextField, let backgroundView = textField.subviews.first else { return }
        textField.textColor = UIColor.darkGrayBlue
        backgroundView.backgroundColor = .white
        backgroundView.layer.cornerRadius = 10.0
        backgroundView.clipsToBounds = true
    }
}

