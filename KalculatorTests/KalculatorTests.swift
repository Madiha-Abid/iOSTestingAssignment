//
//  KalculatorTests.swift
//  KalculatorTests
//
//  Created by Adil Saleem on 31/10/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//

import XCTest
@testable import Kalculator

final class KalculatorTests: XCTestCase {

    //    init
    override func setUp() {
        print("set up completed")
    }
    
    func testPositiveForAllCalculatorFunctions() throws {
        
        let calculator = Calculator()
        
        // Test for append digit
        XCTAssertEqual(try calculator.inputDigit("1"), "1")
        XCTAssertEqual(try calculator.inputDigit("2"), "12")
        XCTAssertEqual(try calculator.inputDigit("3"), "123")
        
        // Test for inputting an operator
        XCTAssertEqual(try calculator.inputDigit("+"), "123")
        
        // Test for inputting more digits after an operator
        XCTAssertEqual(try calculator.inputDigit("4"), "4")
        XCTAssertEqual(try calculator.inputDigit("5"), "45")
        
        
        // Test for handling operator repetition
        XCTAssertEqual(try calculator.inputDigit("+"), "45")
        
        // Performing the addition operation
        XCTAssertEqual(try calculator.inputDigit("*"), "168")
        // Append digit and tests
        XCTAssertEqual(try calculator.inputDigit("7"), "7")
        // Performing the multiplication operation
        XCTAssertEqual(try calculator.inputDigit("="), "1176")
        // Performing the equals operation
        XCTAssertEqual(try calculator.inputDigit("/"), "1176")
        
        // Test inputting more digits after an operator
        XCTAssertEqual(try calculator.inputDigit("2"), "2")
        XCTAssertEqual(try calculator.inputDigit("1"), "21")
        
        // Performing the divsion operation
        XCTAssertEqual(try calculator.inputDigit("="), "56")
        
        // Performing the equals operation
        XCTAssertEqual(try calculator.inputDigit("-"), "56")
        
        // Test inputting more digits after an operator
        XCTAssertEqual(try calculator.inputDigit("5"), "5")
        XCTAssertEqual(try calculator.inputDigit("4"), "54")
        
        // Performing the subtraction operation
        XCTAssertEqual(try calculator.inputDigit("="), "2")
        calculator.clear()
    }
    
    
    func testNegativeOutputIllegalOperation() throws {
        let calculator = Calculator()
        XCTAssertNoThrow(try calculator.inputDigit("5"))
        XCTAssertNoThrow(try calculator.inputDigit("/"))
        XCTAssertNoThrow(try calculator.inputDigit("0"))
        XCTAssertThrowsError(try calculator.inputDigit("="), "Division by zero") { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.illegalOperation)
        }
    }
    
    func testNegativeOutputInputDigit() throws {
        let calculator = Calculator()
        XCTAssertThrowsError(try calculator.inputDigit("A"), "Entered Invalid Digit") { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.invalidDigit)
        }
    }
    
    
    func testPositiveViewControllerFunctions() {
        let viewController = ViewController()
        let button = UIButton()
        button.setTitle("1", for: .normal)
        viewController.viewDidLoad()
        viewController.inputDigit(button)
        
        if let output = viewController.resultScreen.text{
            XCTAssertEqual(output, "1")
        }
        
    }
    
    func testNegativeViewControllerFunctions() {
        let viewController = ViewController()
        let button = UIButton()
        button.setTitle("A", for: .normal)
        viewController.viewDidLoad()
        viewController.inputDigit(button)
        
        if let output = viewController.resultScreen.text{
            XCTAssertEqual(output, "Err")
        }
        
    }
    
    func testForClear() {
        let viewController = ViewController()
        viewController.viewDidLoad()
        
        viewController.clear(self)
        
        XCTAssertEqual(viewController.resultScreen.text, "0")
    }
    
    
    
    //deinit
    override func tearDown() {
        print("tear down completed ")
    }

}
