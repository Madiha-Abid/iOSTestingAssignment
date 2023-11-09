//
//  KalculatorUITests.swift
//  KalculatorUITests
//
//  Created by Adil Saleem on 31/10/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//

import XCTest

final class KalculatorUITests: XCTestCase {

    var app:XCUIApplication?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testButtonsAvailable() throws {
        
        // Get all the buttons
        if let buttons = app?.buttons{
            for digit in 0...9 {
                XCTAssert(buttons["\(digit)"].exists, "Button \(digit) is not available")
            }
            
            XCTAssert(buttons["+"].exists, "Operator '+' is not available")
            XCTAssert(buttons["-"].exists, "Operator '-' is not available")
            XCTAssert(buttons["*"].exists, "Operator '*' is not available")
            XCTAssert(buttons["/"].exists, "Operator '/' is not available")
            XCTAssert(buttons["="].exists, "Operator '=' is not available")
            XCTAssert(buttons["C"].exists, "Clear button 'C' is not available")
            
        }
        
        
    }
    
    func testPositiveUIOutput() throws {
        
        app?.buttons["3"].tap()
        app?.buttons["+"].tap()
        app?.buttons["2"].tap()
        app?.buttons["="].tap()
        
        print("Buttons tapped!")
        
        if let labels = app?.staticTexts{
            XCTAssert(labels["Result Screen"].exists)
            XCTAssertEqual(labels["Result Screen"].label, "5")
        }
    }
    
    func testNegativeUIOutput() throws {
        
        app?.buttons["3"].tap()
        app?.buttons["/"].tap()
        app?.buttons["0"].tap()
        app?.buttons["="].tap()
        
        print("Buttons tapped!")
        
        if let labels = app?.staticTexts{
            XCTAssertEqual(labels["Result Screen"].label, "Err")
        }
    }

}
