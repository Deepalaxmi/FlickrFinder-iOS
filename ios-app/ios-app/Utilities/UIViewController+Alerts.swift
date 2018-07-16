//
//  UIViewController+Alerts.swift
//  ios-app
//
//  Created by Vincent Chau on 7/14/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

extension UIViewController {

    func presentAlertForError(with error: Error?) {
		guard let error = error else { return }
        let errorTitle = NSLocalizedString("Oops.. Something went wrong. 😥", comment: "Error alert title")
        let alert = UIAlertController(title: errorTitle, message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

}
