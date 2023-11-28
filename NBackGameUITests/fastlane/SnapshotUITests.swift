//
//  SnapshotUITests.swift
//  NBackGameUITests
//
//  Created by Kornel Miszczak on 27/05/2021.
//

import XCTest

class SnapshotUITests: XCTestCase {

    @MainActor func testWholeFlowSnapshots() throws {
        let nBack = 2
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        let tutorialButton = app.buttons[AccessibilityIdentifier.Menu.tutorialButton]
        _ = tutorialButton.waitForExistence(timeout: 30)
        snapshot("1MenuScreen")

        tutorialButton.tap()
        
        let backToMenuButton = app.buttons[AccessibilityIdentifier.Tutorial.showMenuButton]
        _ = backToMenuButton.waitForExistence(timeout: 10)
        
        snapshot("2TutorialScreen")

        backToMenuButton.tap()
        
        let playButton = app.buttons[AccessibilityIdentifier.Menu.playButton]
        _ = playButton.waitForExistence(timeout: 5)
        playButton.tap()
        
        let levelSelectionButton = app.buttons["\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(nBack)"]
        _ = levelSelectionButton.waitForExistence(timeout: 10)
        levelSelectionButton.tap()
        
        let positionButton = app.buttons[AccessibilityIdentifier.Game.positionButton]
        _ = positionButton.waitForExistence(timeout: 5)
        positionButton.tap()
        
        snapshot("3GameScreen")
    }
}
