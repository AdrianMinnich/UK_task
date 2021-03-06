//
//  ItemModel.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class ItemModel {

    var id: String
    var name: String
    var color: UIColor
    
    init(id: String, name: String, color: UIColor) {
        self.id = id
        self.name  = name
        self.color = color
    }
}
