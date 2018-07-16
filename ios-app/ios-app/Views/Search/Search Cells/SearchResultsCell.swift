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
        guard let viewModel = viewModel, let imageURL = viewModel.imageURL else { return }
        ImageService.downloadImage(from: imageURL) { [weak self] image in
            self?.thumbnailImageView.image = image
        }
    }
    
}
