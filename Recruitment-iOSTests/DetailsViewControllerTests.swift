//
//  DetailsViewControllerTests.swift
//  Recruitment-iOSTests
//
//  Created by Adrian Minnich on 18/08/2021.
//  Copyright © 2021 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class DetailsViewControllerTests: XCTestCase {

    var sut: DetailsViewController!
    var detailsModel: ItemDetailsModel!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController
        
        let generalModel = ItemGeneralModel(id: "2", name: "Item2", color: .red, preview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
        detailsModel = ItemDetailsModel(id: "2", name: "Item2", color: .red, desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a lacus felis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nullam dignissim facilisis quam et malesuada. Sed imperdiet ipsum ut elit porttitor gravida. Nulla a lectus lorem. Proin sed volutpat risus. Aenean malesuada, nisl id finibus pellentesque, nunc felis pulvinar tellus, in commodo nisl urna et leo. Donec ac ante tortor. Pellentesque consequat tellus nec pellentesque euismod. Mauris euismod, leo auctor aliquet lacinia, dui est pulvinar nulla, fermentum dapibus felis leo nec est. Fusce ultrices, risus at ullamcorper cursus, leo sapien mattis arcu, vitae facilisis massa lacus et libero. Etiam sollicitudin augue porttitor tristique convallis. Aenean imperdiet, tortor dictum tristique ullamcorper, nulla nulla convallis tellus, sit amet luctus purus augue ac leo.")
        
        sut.model = generalModel
        sut.viewDidLoad()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testShouldHaveModel() {
        XCTAssertNotNil(sut.model)
    }
    
    func testShouldHaveCorrectView() {
        XCTAssertEqual(sut.title, "ItEm2")
        XCTAssertEqual(sut.view.backgroundColor, .red)
        XCTAssertEqual(sut.textLabel.text, "Loading...")
    }
}
