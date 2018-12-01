//
//  TestAppUITests.swift
//  TestAppUITests
//
//  Created by Gennadiy Mishin on 01/12/2018.
//  Copyright © 2018 Gennadiy Mishin. All rights reserved.
//

import XCTest

class TestAppUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()

        app.launchArguments.append("--uitesting")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadCount() {
        app.launch()
        
        let cell = app.tables["ItemsTableView"].cells["ItemCell0"]
        XCTAssertTrue(cell.waitForExistence(timeout: 10.0))
        
        let cellCountUI = app.tables["ItemsTableView"].cells.count
        let expectedCount = 6
        XCTAssertEqual(cellCountUI, expectedCount)
    }
    
    func testDetailScreenOpen() {
        app.launch()
        
        let cell = app.tables["ItemsTableView"].cells["ItemCell0"]
        XCTAssertTrue(cell.waitForExistence(timeout: 10.0))
        
        cell.tap()
        
        let doneButton = app.buttons["DoneButton"]
        XCTAssertTrue(doneButton.exists)
    }
    
    func testPresentDismissDetail() {
        app.launch()
        
        let cell = app.tables["ItemsTableView"].cells["ItemCell1"]
        XCTAssertTrue(cell.waitForExistence(timeout: 10.0))
        
        if cell.exists {
            cell.tap()
        }
        
        let doneButton = app.buttons["DoneButton"]
        XCTAssertTrue(doneButton.exists)
        
        doneButton.tap()
        XCTAssertFalse(doneButton.exists)
    }

}
