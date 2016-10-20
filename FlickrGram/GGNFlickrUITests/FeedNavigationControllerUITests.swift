//
//  FeedNavigationControllerUITests.swift
//  UITests
//
//  Created by Garric Nahapetian on 4/14/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import XCTest
@testable import GGNFlickr

class FeedNavigationControllerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()

    }
    
    override func tearDown() {
        super.tearDown()
        XCUIApplication().terminate()
    }
    
    func testControllerPushesViewControllerOntoStack() {
        XCUIApplication().tables.childrenMatchingType(.Cell).elementBoundByIndex(0).childrenMatchingType(.StaticText).element.tap()
        
        let actual = XCUIApplication().otherElements.containingType(.NavigationBar, identifier:"GGNFlickr.DetailView").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Image).count
        let expected: UInt = 1
        
        XCTAssertEqual(actual, expected)
        XCTAssertTrue(XCUIApplication().navigationBars["GGNFlickr.DetailView"].buttons["GGNFlickr"].exists)
    }
    
    func testControllerPopsViewControllerOffStackByTappingBackButton() {
        let app = XCUIApplication()
        app.tables.childrenMatchingType(.Cell).elementBoundByIndex(0).childrenMatchingType(.StaticText).element.tap()
        app.navigationBars["GGNFlickr.DetailView"].buttons["GGNFlickr"].tap()
        XCTAssertTrue(app.tables.count == 1)
        XCTAssertTrue(app.tables.childrenMatchingType(.Cell).count > 1)
    }
    
}









