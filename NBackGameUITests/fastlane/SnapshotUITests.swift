//
//  SnapshotUITests.swift
//  NBackGameUITests
//
//  Created by Kornel Miszczak on 27/05/2021.
//

import XCTest

class SnapshotUITests: XCTestCase {

    @MainActor func testMenuPlusTutorialSnapshots() throws {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        Thread.sleep(forTimeInterval: TimeInterval(1))

        snapshot("1MenuScreen")
        Thread.sleep(forTimeInterval: TimeInterval(1))

        app.buttons[AccessibilityIdentifier.Menu.tutorialButton].tap()
        snapshot("2TutorialScreen")
        Thread.sleep(forTimeInterval: TimeInterval(1))

    }

    @MainActor func testGameSnapshots() throws {
        let nBack = 2
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        
        app.buttons[AccessibilityIdentifier.Menu.playButton].tap()
        app.buttons["\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(nBack)"].tap()
        Thread.sleep(forTimeInterval: TimeInterval(10))
        app.buttons[AccessibilityIdentifier.Game.positionButton].tap()
        snapshot("2GameScreen")

        Thread.sleep(forTimeInterval: TimeInterval(10))
        app.buttons[AccessibilityIdentifier.Game.soundButton].tap()
        snapshot("3GameScreen")
        Thread.sleep(forTimeInterval: TimeInterval(1))

    }
}
