//
//  TutorialUITests.swift
//  NBackGameUITests
//
//  Created by Kornel Miszczak on 09/02/2021.
//

import XCTest

class PlayGameUITests: XCTestCase {
    
    func test2nBack25RoundsSoundClicks() throws {
        let roundNumber = 25
        let nBack = 2
        
        let app = XCUIApplication()
        app.launch()
               
        app.tapButton(AccessibilityIdentifier.Menu.playButton)
        app.tapButton("\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(nBack)")
        app.tapButton(AccessibilityIdentifier.Game.soundButton)

        let soundButton = app.buttons[AccessibilityIdentifier.Game.soundButton]
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
        
        XCTAssertNotNil(correctSelectionTextLabel)
        XCTAssertNotNil(incorrectSelectionSoundLabel)
    }
    
    func test2nBack25RoundsPositionClicks() throws {
        let roundNumber = 25
        let nBack = 1
        
        let app = XCUIApplication()
        app.launch()
               
        app.tapButton(AccessibilityIdentifier.Menu.playButton)
        app.tapButton("\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(nBack)")
        app.tapButton(AccessibilityIdentifier.Game.positionButton)

        let positionButton = app.buttons[AccessibilityIdentifier.Game.positionButton]

        for _ in 1..<roundNumber {
            expectation(for: NSPredicate(format: "isEnabled == true"), evaluatedWith: positionButton, handler: nil)
            waitForExpectations(timeout: 10.0, handler: nil)
            
            positionButton.tap()
        }
                
        let correctSelectionText = app.staticTexts[AccessibilityIdentifier.GameSummary.correctSelectionPositionText]
        _ = correctSelectionText.waitForExistence(timeout: 5)
        
        let correctSelectionTextLabel = correctSelectionText.label
        XCTAssertNotNil(correctSelectionTextLabel)

        let incorrectSelectionPositionLabel = app.staticTexts[AccessibilityIdentifier.GameSummary.incorrectSelectionPositionText].label
        XCTAssertNotNil(incorrectSelectionPositionLabel)

        let value: Int = Int(correctSelectionTextLabel)! + Int(incorrectSelectionPositionLabel)!
        
        XCTAssertEqual(roundNumber - nBack, value)
        
    }
    
    func test2nBack25RoundsPositionAndSoundClicks() throws {
        let roundNumber = 25
        let nBack = 2
        
        let app = XCUIApplication()

        app.launch()
               
        app.tapButton(AccessibilityIdentifier.Menu.playButton)
        app.tapButton("\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(nBack)")

        app.tapButton(AccessibilityIdentifier.Game.positionButton)
        app.tapButton(AccessibilityIdentifier.Game.soundButton)

        let positionButton = app.buttons[AccessibilityIdentifier.Game.positionButton]
        let soundButton = app.buttons[AccessibilityIdentifier.Game.soundButton]
        
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
        
        XCTAssertNotNil(correctSelectionSoundTextLabel)
        XCTAssertNotNil(incorrectSelectionSoundLabel)
    }
    
    func testPositionClicksPlayTwiceAndBackToMenu() throws {
        let roundNumber = 25
        let nBack = 2
        
        let app = XCUIApplication()

        app.launch()
               
        
        app.tapButton(AccessibilityIdentifier.Menu.playButton)
        app.tapButton("\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(nBack)")
        app.tapButton(AccessibilityIdentifier.Game.positionButton)

        let positionButton = app.buttons[AccessibilityIdentifier.Game.positionButton]

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
    
    func testBackToMenu() throws {
        let nBack = 2
        let app = XCUIApplication()
        
        app.launch()
        
        app.tapButton(AccessibilityIdentifier.Menu.playButton)
        app.tapButton("\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(nBack)")
        app.tapButton(AccessibilityIdentifier.Game.soundButton)
        app.tapButton(AccessibilityIdentifier.Game.showMenuButton)
        app.tapButton(AccessibilityIdentifier.Menu.playButton)
    }
}
