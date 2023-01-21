////
////  LevelSelectionUITests.swift
////  NBackGameUITests
////
////  Created by Kornel Miszczak on 12/05/2021.
////
//
//import XCTest
//
//class LevelSelectionUITests: XCTestCase {
//
//    func testBackToMenu() throws {
//        let nBack = 2
//        let app = XCUIApplication()
//        
//        app.launch()
//        
//        app.buttons[AccessibilityIdentifier.Menu.playButton].tap()
//        let levelSelectionButton = app.buttons["\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(nBack)"]
//        
//        _ = levelSelectionButton.waitForExistence(timeout: 5)
//        
//        app.buttons[AccessibilityIdentifier.LevelSelection.showMenuButton].tap()
//        
//        let playButtonFromMenu = app.buttons[AccessibilityIdentifier.Menu.playButton]
//        _ = playButtonFromMenu.waitForExistence(timeout: 3.0)
//    }
//
//}
