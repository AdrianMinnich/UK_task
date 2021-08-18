//
//  NetworkingManagerTests.swift
//  Recruitment-iOSTests
//
//  Created by Adrian Minnich on 17/08/2021.
//  Copyright © 2021 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class NetworkingManagerTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testShouldDownloadItems() {
        
        var expectedItems: [ItemGeneralModel] = []
        expectedItems.append(ItemGeneralModel(id: "2", name: "Item2", color: UIColor.red, preview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."))
        expectedItems.append(ItemGeneralModel(id: "1", name: "Item1", color: UIColor.green, preview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum eu velit vel ultrices. Ut vulputate scelerisque erat, ut mollis nibh convallis feugiat."))
        expectedItems.append(ItemGeneralModel(id: "4", name: "Item4", color: UIColor.blue, preview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum eu velit vel ultrices. Ut vulputate scelerisque erat, ut mollis nibh convallis feugiat. Maecenas vulputate tortor in odio egestas bibendum a quis erat."))
        expectedItems.append(ItemGeneralModel(id: "3", name: "Item3", color: UIColor.yellow, preview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum eu velit vel ultrices. Ut vulputate scelerisque erat, ut mollis nibh convallis feugiat. Maecenas vulputate tortor in odio egestas bibendum a quis erat. Proin volutpat turpis vestibulum elementum congue. Sed vitae sem purus. Morbi placerat sapien eget leo mattis molestie."))
        expectedItems.append(ItemGeneralModel(id: "5", name: "Item5", color: UIColor.purple, preview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum eu velit vel ultrices. Ut vulputate scelerisque erat, ut mollis nibh convallis feugiat. Maecenas vulputate tortor in odio egestas bibendum a quis erat. Proin volutpat turpis vestibulum elementum congue. "))
        
        let expectation = expectation(description: "downloadItems gets items and runs the callback")
        
        NetworkingManager.sharedManager.downloadItems() { result in
            switch result {
            case .success(let items):
                XCTAssertNotNil(items)
                XCTAssertEqual(items, expectedItems)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("downloadItems failed: \(error)")
            }
        }
        
        waitForExpectations(timeout: 2) { error in
            if let error = error {
                XCTFail("waitForExpectation failed: \(error)")
            }
        }
    }
    
    func testShouldDownloadItemWithID() {
        
        let expectedItem = ItemDetailsModel(id: "1", name: "Item1", color: UIColor.green, desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a lacus felis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nullam dignissim facilisis quam et malesuada. Sed imperdiet ipsum ut elit porttitor gravida. Nulla a lectus lorem. Proin sed volutpat risus. Aenean malesuada, nisl id finibus pellentesque, nunc felis pulvinar tellus, in commodo nisl urna et leo. Donec ac ante tortor. Pellentesque consequat tellus nec pellentesque euismod. Mauris euismod, leo auctor aliquet lacinia, dui est pulvinar nulla, fermentum dapibus felis leo nec est. Fusce ultrices, risus at ullamcorper cursus, leo sapien mattis arcu, vitae facilisis massa lacus et libero. Etiam sollicitudin augue porttitor tristique convallis. Aenean imperdiet, tortor dictum tristique ullamcorper, nulla nulla convallis tellus, sit amet luctus purus augue ac leo.")
        
        let expectation = expectation(description: "downloadItem gets item with given ID and runs the callback")
        
        NetworkingManager.sharedManager.downloadItemWithID("1") { result in
            switch result {
            case .success(let item):
                XCTAssertNotNil(item)
                XCTAssertEqual(item.name, expectedItem.name)
                XCTAssertEqual(item.color, expectedItem.color)
                XCTAssertEqual(item.id, expectedItem.id)
                XCTAssertEqual(item.desc, expectedItem.desc)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("downloadItemWithID failed: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 2) { error in
            if let error = error {
                XCTFail("waitForExpectation failed: \(error.localizedDescription)")
            }
        }
    }
}
