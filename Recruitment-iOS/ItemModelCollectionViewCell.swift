//
//  ItemModelCollectionViewCell.swift
//  Recruitment-iOS
//
//  Created by Adrian Minnich on 16/08/2021.
//  Copyright © 2021 Untitled Kingdom. All rights reserved.
//

import UIKit

class ItemModelCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ItemModelCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        previewLabel.sizeToFit()
    }
    
    func configure(with model: ItemModel) {
        titleLabel.text = model.name
        previewLabel.text = model.preview
        backgroundColor = model.color
    }
}
