//
//  Recruitment_iOSUITests.swift
//  Recruitment-iOSUITests
//
//  Created by Adrian Minnich on 17/08/2021.
//  Copyright © 2021 Untitled Kingdom. All rights reserved.
//

import XCTest

class Recruitment_iOSUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testTappingStartShouldPresentTableView() {
 
        app/*@START_MENU_TOKEN@*/.staticTexts["START"]/*[[".buttons[\"START\"].staticTexts[\"START\"]",".staticTexts[\"START\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let table = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: table, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testTappingTableViewCellShouldPushDetailsViewControllerWithValidData() {
        
        app/*@START_MENU_TOKEN@*/.buttons["START"].staticTexts["START"]/*[[".buttons[\"START\"].staticTexts[\"START\"]",".staticTexts[\"START\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        
        let cell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Item2"]/*[[".cells.staticTexts[\"Item2\"]",".staticTexts[\"Item2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: cell, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

        cell.tap()
        
        let navBar = app.navigationBars["ItEm2"].staticTexts["ItEm2"]
        XCTAssertTrue(navBar.exists)
        
        let firstLabel = app.staticTexts["Loading..."]
        XCTAssertTrue(firstLabel.exists)
        
        let secondLabelPredicate = NSPredicate(format: "label BEGINSWITH 'Lorem ipsum dolor sit amet,'")
        let secondlabel = app.staticTexts.element(matching: secondLabelPredicate)
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: secondlabel, handler: nil)
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testTappingCollectionTabBarShouldPresentCollectionView() {

        app/*@START_MENU_TOKEN@*/.staticTexts["START"]/*[[".buttons[\"START\"].staticTexts[\"START\"]",".staticTexts[\"START\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tabBars["Tab Bar"].buttons["Collection"].tap()
        
        let verticalScrollBar1PageCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 1 page").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 1 page\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: verticalScrollBar1PageCollectionView, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testTappingCollectionViewCellShouldPushDetailsViewControllerWithValidData() {
        
        app/*@START_MENU_TOKEN@*/.staticTexts["START"]/*[[".buttons[\"START\"].staticTexts[\"START\"]",".staticTexts[\"START\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tabBars["Tab Bar"].buttons["Collection"].tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Item2"]/*[[".cells.staticTexts[\"Item2\"]",".staticTexts[\"Item2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let navBar = app.navigationBars["ItEm2"].staticTexts["ItEm2"]
        XCTAssertTrue(navBar.exists)
        
        let firstLabel = app.staticTexts["Loading..."]
        XCTAssertTrue(firstLabel.exists)
        
        let secondLabelPredicate = NSPredicate(format: "label BEGINSWITH 'Lorem ipsum dolor sit amet,'")
        let secondlabel = app.staticTexts.element(matching: secondLabelPredicate)
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: secondlabel, handler: nil)
        waitForExpectations(timeout: 3, handler: nil)
    }
}
