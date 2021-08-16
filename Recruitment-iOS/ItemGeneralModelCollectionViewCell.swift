//
//  ItemGeneralModelCollectionViewCell.swift
//  Recruitment-iOS
//
//  Created by Adrian Minnich on 16/08/2021.
//  Copyright © 2021 Untitled Kingdom. All rights reserved.
//

import UIKit

class ItemGeneralModelCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ItemGeneralModelCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewLabel: UILabel!
    
    func configure(with model: ItemGeneralModel) {
        titleLabel.text = model.name
        previewLabel.text = model.preview
        backgroundColor = model.color
    }
}
