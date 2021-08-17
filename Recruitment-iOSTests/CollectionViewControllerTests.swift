//
//  CollectionViewControllerTests.swift
//  Recruitment-iOSTests
//
//  Created by Adrian Minnich on 17/08/2021.
//  Copyright © 2021 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class CollectionViewControllerTests: XCTestCase {
    
    var sut: CollectionViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "CollectionViewController") as? CollectionViewController
        
        var items: [ItemGeneralModel] = []
        items.append(ItemGeneralModel(id: "2", name: "Item2", color: UIColor.red, preview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."))
        items.append(ItemGeneralModel(id: "1", name: "Item1", color: UIColor.green, preview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum eu velit vel ultrices. Ut vulputate scelerisque erat, ut mollis nibh convallis feugiat."))
        items.append(ItemGeneralModel(id: "4", name: "Item4", color: UIColor.blue, preview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum eu velit vel ultrices. Ut vulputate scelerisque erat, ut mollis nibh convallis feugiat. Maecenas vulputate tortor in odio egestas bibendum a quis erat."))
        items.append(ItemGeneralModel(id: "3", name: "Item3", color: UIColor.yellow, preview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum eu velit vel ultrices. Ut vulputate scelerisque erat, ut mollis nibh convallis feugiat. Maecenas vulputate tortor in odio egestas bibendum a quis erat. Proin volutpat turpis vestibulum elementum congue. Sed vitae sem purus. Morbi placerat sapien eget leo mattis molestie."))
        items.append(ItemGeneralModel(id: "5", name: "Item5", color: UIColor.purple, preview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum eu velit vel ultrices. Ut vulputate scelerisque erat, ut mollis nibh convallis feugiat. Maecenas vulputate tortor in odio egestas bibendum a quis erat. Proin volutpat turpis vestibulum elementum congue. "))
        
        sut.itemModels = items
    }

    override func tearDown() {
        super.tearDown()
    }
}
