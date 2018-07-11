//
//  SearchResultsCell.swift
//  ios-app
//
//  Created by Vincent Chau on 7/3/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

class SearchResultsCell: UICollectionViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var thumbnailImageView: UIImageView!

    // MARK: - Variables

    var viewModel: SearchResultViewModel? {
        didSet {
            updateContent()
        }
    }

    // MARK: - View Life Cycle

    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }

    // MARK: - Configure Views

    func updateContent() {
        if let imageURL = viewModel?.imageURL {
            thumbnailImageView.setImageFromURL(imageURL)
        }
    }

}
