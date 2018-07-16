//
//  SearchDetailViewController.swift
//  ios-app
//
//  Created by Vincent Chau on 7/15/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController {

	var viewModel: SearchResultViewModel?

	lazy var coverImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		setupConstraints()
		updateContent()
    }

	func setupConstraints() {
		view.addSubview(coverImageView)
		var constraints: [NSLayoutConstraint] = []
		constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[coverImageView]|", options: [], metrics: nil, views: ["coverImageView": coverImageView]))
		constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[coverImageView]|", options: [], metrics: nil, views: ["coverImageView": coverImageView]))
		NSLayoutConstraint.activate(constraints)
	}

	func updateContent() {
		guard let imageURL = viewModel?.imageURL else { return }
		ImageService.downloadImage(from: imageURL) { [weak self] image in
			self?.coverImageView.image = image
		}
	}

}
