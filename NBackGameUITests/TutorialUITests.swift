//
//  TutorialUITests.swift
//  NBackGameUITests
//
//  Created by Kornel Miszczak on 11/02/2021.
//

import XCTest

class TutorialUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   
    func testTutorialTwoForwardOneBackwardClicks() throws {
        // UI tests must launch the application that they test.

        let app = XCUIApplication()

        app.launch()
               
        app.buttons[AccessibilityIdentifier.Menu.tutorialButton].tap()
        
        let nextButton = app.buttons[AccessibilityIdentifier.Tutorial.nextButton]
        let previousButton = app.buttons[AccessibilityIdentifier.Tutorial.previousButton]
        
        _ = nextButton.waitForExistence(timeout: 3.0)
        nextButton.tap()
        
        _ = previousButton.waitForExistence(timeout: 3.0)
        previousButton.tap()
        
        for _ in 0..<9 {
            Thread.sleep(forTimeInterval: 1.0)
            nextButton.tap()
            Thread.sleep(forTimeInterval: 1.0)
            previousButton.tap()
            Thread.sleep(forTimeInterval: 1.0)
            nextButton.tap()
        }
        
        Thread.sleep(forTimeInterval: 1.0)
        
        app.buttons[AccessibilityIdentifier.Tutorial.menuButton].tap()
        
        XCTAssert(app.buttons[AccessibilityIdentifier.Menu.tutorialButton].exists)

    }
    
    
    func testTutorialStraightAway() throws {
        let app = XCUIApplication()

        app.launch()
               
        app.buttons[AccessibilityIdentifier.Menu.tutorialButton].tap()
        
        let nextButton = app.buttons[AccessibilityIdentifier.Tutorial.nextButton]
        _ = nextButton.waitForExistence(timeout: 3.0)
        
        for _ in 0..<9 {
            nextButton.tap()
            Thread.sleep(forTimeInterval: 1.0)
        }
        
        app.buttons[AccessibilityIdentifier.Tutorial.menuButton].tap()
    
        XCTAssert(app.buttons[AccessibilityIdentifier.Menu.tutorialButton].exists)

    }
    
    func testDoTutorial3TimesStraightAway() throws {
        let app = XCUIApplication()

        app.launch()
               
        for _ in 0..<3 {
            app.buttons[AccessibilityIdentifier.Menu.tutorialButton].tap()
            
            let nextButton = app.buttons[AccessibilityIdentifier.Tutorial.nextButton]
            _ = nextButton.waitForExistence(timeout: 3.0)
            
            for _ in 0..<9 {
                nextButton.tap()
                Thread.sleep(forTimeInterval: 1.0)
            }
            
            app.buttons[AccessibilityIdentifier.Tutorial.menuButton].tap()
        }
       
    
        XCTAssert(app.buttons[AccessibilityIdentifier.Menu.tutorialButton].exists)
    }
    
}
