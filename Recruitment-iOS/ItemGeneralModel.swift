//
//  ItemGeneralModel.swift
//  Recruitment-iOS
//
//  Created by Adrian Minnich on 16/08/2021.
//  Copyright © 2021 Untitled Kingdom. All rights reserved.
//

import UIKit

class ItemGeneralModel: ItemModel, Equatable {
    
    var preview: String
    
    init(id: String, name: String, color: UIColor, preview: String) {
        self.preview = preview
        super.init(id: id, name: name, color: color)
    }
    
    static func == (lhs: ItemGeneralModel, rhs: ItemGeneralModel) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id && lhs.color == rhs.color && lhs.preview == rhs.preview
    }
    
}
