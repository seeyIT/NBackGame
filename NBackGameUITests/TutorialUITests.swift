//
//  TutorialUITests.swift
//  NBackGameUITests
//
//  Created by Kornel Miszczak on 11/02/2021.
//

import XCTest

class TutorialUITests: XCTestCase {
   
    func testTutorialTwoForwardOneBackwardClicks() throws {
        let app = XCUIApplication()
        app.launch()
               
        app.tapButton(AccessibilityIdentifier.Menu.tutorialButton)
        
        for _ in 0..<9 {
            app.tapButton(AccessibilityIdentifier.Tutorial.nextButton, swipeUpBeforeTap: true)
            
            app.tapButton(AccessibilityIdentifier.Tutorial.previousButton, swipeUpBeforeTap: true)
            
            app.tapButton(AccessibilityIdentifier.Tutorial.nextButton, swipeUpBeforeTap: true)
        }
        
        app.tapButton(AccessibilityIdentifier.Tutorial.menuButton)
        
        XCTAssert(app.buttons[AccessibilityIdentifier.Menu.tutorialButton].exists)
    }
    
    func testTutorialStraightAway() throws {
        let app = XCUIApplication()
        app.launch()
               
        app.tapButton(AccessibilityIdentifier.Menu.tutorialButton)

        for _ in 0..<9 {
            app.tapButton(AccessibilityIdentifier.Tutorial.nextButton, swipeUpBeforeTap: true)

        }
        
        app.tapButton(AccessibilityIdentifier.Tutorial.menuButton)
    
        XCTAssert(app.buttons[AccessibilityIdentifier.Menu.tutorialButton].exists)
    }
    
    func testDoTutorial3TimesStraightAway() throws {
        let app = XCUIApplication()

        app.launch()
               
        for _ in 0..<3 {
            app.tapButton(AccessibilityIdentifier.Menu.tutorialButton)
            
            for _ in 0..<9 {
                app.tapButton(AccessibilityIdentifier.Tutorial.nextButton, swipeUpBeforeTap: true)
            }
            app.tapButton(AccessibilityIdentifier.Tutorial.menuButton)
        }
        XCTAssert(app.buttons[AccessibilityIdentifier.Menu.tutorialButton].exists)
    }
}
