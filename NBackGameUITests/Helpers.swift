//
//  Helpers.swift
//  NBackGameUITests
//
//  Created by Kornel Miszczak on 20/04/2023.
//

import XCTest

extension XCUIApplication {
    func tapButton(_ id: String, swipeUpBeforeTap: Bool = false) {
        let button = buttons[id]
        _ = button.waitForExistence(timeout: 5.0)
        if swipeUpBeforeTap{
            swipeUp()
        }
        button.tap()
    }
}
