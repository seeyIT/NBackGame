////
////  TutorialUITests.swift
////  NBackGameUITests
////
////  Created by Kornel Miszczak on 11/02/2021.
////
//
//import XCTest
//
//class TutorialUITests: XCTestCase {
//   
//    func testTutorialTwoForwardOneBackwardClicks() throws {
//        // UI tests must launch the application that they test.
//
//        let app = XCUIApplication()
//
//        app.launch()
//               
//        app.buttons[AccessibilityIdentifier.Menu.tutorialButton].tap()
//        
//        let nextButton = app.buttons[AccessibilityIdentifier.Tutorial.nextButton]
//        let previousButton = app.buttons[AccessibilityIdentifier.Tutorial.previousButton]
//
//        _ = nextButton.waitForExistence(timeout: 3.0)
//        nextButton.tap()
//        
//        _ = previousButton.waitForExistence(timeout: 3.0)
//        previousButton.tap()
//        
//        for _ in 0..<9 {
//            Thread.sleep(forTimeInterval: 1.0)
//            nextButton.tap()
//            Thread.sleep(forTimeInterval: 1.0)
//            previousButton.tap()
//            Thread.sleep(forTimeInterval: 1.0)
//            nextButton.tap()
//        }
//        
//        Thread.sleep(forTimeInterval: 1.0)
//        
//        app.buttons[AccessibilityIdentifier.Tutorial.menuButton].tap()
//        
//        XCTAssert(app.buttons[AccessibilityIdentifier.Menu.tutorialButton].exists)
//
//    }
//    
//    func testTutorialStraightAway() throws {
//        let app = XCUIApplication()
//
//        app.launch()
//               
//        app.buttons[AccessibilityIdentifier.Menu.tutorialButton].tap()
//        
//        let nextButton = app.buttons[AccessibilityIdentifier.Tutorial.nextButton]
//        _ = nextButton.waitForExistence(timeout: 3.0)
//        
//        for _ in 0..<9 {
//            nextButton.tap()
//            Thread.sleep(forTimeInterval: 1.0)
//        }
//        
//        app.buttons[AccessibilityIdentifier.Tutorial.menuButton].tap()
//    
//        XCTAssert(app.buttons[AccessibilityIdentifier.Menu.tutorialButton].exists)
//
//    }
//    
//    func testDoTutorial3TimesStraightAway() throws {
//        let app = XCUIApplication()
//
//        app.launch()
//               
//        for _ in 0..<3 {
//            app.buttons[AccessibilityIdentifier.Menu.tutorialButton].tap()
//            
//            let nextButton = app.buttons[AccessibilityIdentifier.Tutorial.nextButton]
//            _ = nextButton.waitForExistence(timeout: 3.0)
//            
//            for _ in 0..<9 {
//                nextButton.tap()
//                Thread.sleep(forTimeInterval: 1.0)
//            }
//            
//            app.buttons[AccessibilityIdentifier.Tutorial.menuButton].tap()
//        }
//       
//        XCTAssert(app.buttons[AccessibilityIdentifier.Menu.tutorialButton].exists)
//    }
//    
//}
