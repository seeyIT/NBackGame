//
//  TutorialUITests.swift
//  NBackGameUITests
//
//  Created by Kornel Miszczak on 09/02/2021.
//

import XCTest

class PlayGameUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test2nBack5RoundsSoundClicks() throws {
        // UI tests must launch the application that they test.
        let roundNumber = 5
        let nBack = 2
        
        let app = XCUIApplication()

        app.launch()
               
        app.buttons[AccessibilityIdentifier.Menu.playButton].tap()
        app.buttons["\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(nBack)"].tap()
        
        
        let soundButton = app.buttons[AccessibilityIdentifier.Game.soundButton]
        _ = soundButton.waitForExistence(timeout: 5)
        
        
        soundButton.tap()

        for _ in 1..<roundNumber {
            expectation(for: NSPredicate(format: "isEnabled == true"), evaluatedWith: soundButton, handler: nil)
            waitForExpectations(timeout: 10.0, handler: nil)
            
            soundButton.tap()
        }
                
        let correctSelectionText = app.staticTexts[AccessibilityIdentifier.GameSummary.correctSelectionSoundText]
        _ = correctSelectionText.waitForExistence(timeout: 5)
        
        let correctSelectionTextLabel = correctSelectionText.label
        let incorrectSelectionSoundLabel = app.staticTexts[AccessibilityIdentifier.GameSummary.incorrectSelectionSoundText].label
      
        let value: Int = (Int(correctSelectionTextLabel) ?? 0) + (Int(incorrectSelectionSoundLabel) ?? 0)
        
        XCTAssertEqual(roundNumber - nBack, value)
    }
    
    func test2nBack5RoundsPositionClicks() throws {
        // UI tests must launch the application that they test.
        let roundNumber = 5
        let nBack = 2
        
        let app = XCUIApplication()

        app.launch()
               
        app.buttons[AccessibilityIdentifier.Menu.playButton].tap()
        app.buttons["\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(nBack)"].tap()
        
        
        let positionButton = app.buttons[AccessibilityIdentifier.Game.positionButton]
        _ = positionButton.waitForExistence(timeout: 5)
        
        
        positionButton.tap()

        for _ in 1..<roundNumber {
            expectation(for: NSPredicate(format: "isEnabled == true"), evaluatedWith: positionButton, handler: nil)
            waitForExpectations(timeout: 10.0, handler: nil)
            
            positionButton.tap()
        }
                
        let correctSelectionText = app.staticTexts[AccessibilityIdentifier.GameSummary.correctSelectionPositionText]
        _ = correctSelectionText.waitForExistence(timeout: 5)
        
        let correctSelectionTextLabel = correctSelectionText.label
        let incorrectSelectionPositionLabel = app.staticTexts[AccessibilityIdentifier.GameSummary.incorrectSelectionPositionText].label
      
        let value: Int = (Int(correctSelectionTextLabel) ?? 0) + (Int(incorrectSelectionPositionLabel) ?? 0)
        
        XCTAssertEqual(roundNumber - nBack, value)
    }
    
    func test2nBack5RoundsPositionAndSoundClicks() throws {
        // UI tests must launch the application that they test.
        let roundNumber = 5
        let nBack = 2
        
        let app = XCUIApplication()

        app.launch()
               
        app.buttons[AccessibilityIdentifier.Menu.playButton].tap()
        app.buttons["\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(nBack)"].tap()
        
        
        let positionButton = app.buttons[AccessibilityIdentifier.Game.positionButton]
        let soundButton = app.buttons[AccessibilityIdentifier.Game.soundButton]
        _ = positionButton.waitForExistence(timeout: 5)
        _ = soundButton.waitForExistence(timeout: 5)

        
        positionButton.tap()
        soundButton.tap()
        
        for _ in 1..<roundNumber {
            expectation(for: NSPredicate(format: "isEnabled == true"), evaluatedWith: positionButton, handler: nil)
            expectation(for: NSPredicate(format: "isEnabled == true"), evaluatedWith: soundButton, handler: nil)

            waitForExpectations(timeout: 10.0, handler: nil)
            
            positionButton.tap()
            soundButton.tap()
        }
                
        let correctSelectionPositionText = app.staticTexts[AccessibilityIdentifier.GameSummary.correctSelectionPositionText]
        let correctSelectionSoundText = app.staticTexts[AccessibilityIdentifier.GameSummary.correctSelectionSoundText]
        _ = correctSelectionPositionText.waitForExistence(timeout: 5)
        _ = correctSelectionSoundText.waitForExistence(timeout: 5)

        let correctSelectionPositionTextLabel = correctSelectionPositionText.label
        let incorrectSelectionPositionLabel = app.staticTexts[AccessibilityIdentifier.GameSummary.incorrectSelectionPositionText].label
        let positionValue: Int = (Int(correctSelectionPositionTextLabel) ?? 0) + (Int(incorrectSelectionPositionLabel) ?? 0)
        
        XCTAssertEqual(roundNumber - nBack, positionValue)
        
        
        let correctSelectionSoundTextLabel = correctSelectionSoundText.label
        let incorrectSelectionSoundLabel = app.staticTexts[AccessibilityIdentifier.GameSummary.incorrectSelectionSoundText].label
        let soundValue: Int = (Int(correctSelectionSoundTextLabel) ?? 0) + (Int(incorrectSelectionSoundLabel) ?? 0)
        
        XCTAssertEqual(roundNumber - nBack, soundValue)
    }
    
    
    func testPositionClicksPlayTwiceAndBackToMenu() throws {
        // UI tests must launch the application that they test.
        let roundNumber = 5
        let nBack = 2
        
        let app = XCUIApplication()

        app.launch()
               
        app.buttons[AccessibilityIdentifier.Menu.playButton].tap()
        app.buttons["\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(nBack)"].tap()
        
        
        let positionButton = app.buttons[AccessibilityIdentifier.Game.positionButton]
        _ = positionButton.waitForExistence(timeout: 5)
        
        positionButton.tap()

        for _ in 1..<roundNumber {
            expectation(for: NSPredicate(format: "isEnabled == true"), evaluatedWith: positionButton, handler: nil)
            waitForExpectations(timeout: 10.0, handler: nil)
            positionButton.tap()
        }
                
        let playAgainButton = app.buttons[AccessibilityIdentifier.GameSummary.playAgainButton]
        _ = playAgainButton.waitForExistence(timeout: 5)
        playAgainButton.tap()
        
        _ = positionButton.waitForExistence(timeout: 5)
        positionButton.tap()
        for _ in 1..<roundNumber {
            expectation(for: NSPredicate(format: "isEnabled == true"), evaluatedWith: positionButton, handler: nil)
            waitForExpectations(timeout: 10.0, handler: nil)
            positionButton.tap()
        }
        
        
        let menuButton = app.buttons[AccessibilityIdentifier.GameSummary.menuButton]
        _ = menuButton.waitForExistence(timeout: 5)
       
        menuButton.tap()
       
        let playButton = app.buttons[AccessibilityIdentifier.Menu.playButton]
        _ = playButton.waitForExistence(timeout: 5)
    }
 
    
    func testUnlockLevel3FromLevel2() throws {
        
    }
}
