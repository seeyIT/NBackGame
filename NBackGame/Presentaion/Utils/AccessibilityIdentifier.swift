//
//  AccessibilityIdentifier.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 11/02/2021.
//

import Foundation

enum AccessibilityIdentifier {
    enum Menu {
        static let playButton = "AccessibilityIdentifierPlayButtonInMenu"
        static let tutorialButton = "AccessibilityIdentifierTutorialButtonInMenu"
        static let statisticsButton = "AccessibilityIdentifierStatisticsButtonInMenu"
    }
    
    enum LevelSelection {
        static let levelPrefixButton = "AccessibilityIdentifierLevelPrefixButtonInLevelSelection"
        static let showMenuButton = "AccessibilityIdentifierShowMenuButtonInLevelSelection"
    }
    
    enum Game {
        static let fieldNumberPrefixButton = "AccessibilityIdentifierFieldNumberPrefixButtonInGame"
        static let positionButton = "AccessibilityIdentifierPositionButtonInGame"
        static let soundButton = "AccessibilityIdentifierSoundButtonInGame"
        static let showMenuButton = "AccessibilityIdentifierShowMenuButtonInGame"
    }
    
    enum GameSummary {
        static let playAgainButton = "AccessibilityIdentifierPlayAgainButtonInGameSummary"
        static let menuButton = "AccessibilityIdentifierMenuButtonInGameSummary"
        
        static let correctSelectionPositionText = "AccessibilityIdentifierCorrectSelectionPositionTextInGameSummary"
        static let incorrectSelectionPositionText = "AccessibilityIdentifierIncorrectSelectionPositionTextInGameSummary"
        static let missedSelectionPositionText = "AccessibilityIdentifierMissedSelectionPositionTextInGameSummary"
        static let correctSelectionSoundText = "AccessibilityIdentifierCorrectSelectionSoundTextInGameSummary"
        static let incorrectSelectionSoundText = "AccessibilityIdentifierIncorrectSelectionSoundInGameSummary"
        static let missedSelectionSoundText = "AccessibilityIdentifierMissedSelectionSoundInGameSummary"
        
    }
    
    enum Tutorial {
        static let nextButton = "AccessibilityIdentifierNextButtonInTutorial"
        static let previousButton = "AccessibilityIdentifierPreviousButtonInTutorial"
        static let menuButton = "AccessibilityIdentifierMenuButtonInTutorial"
        static let showMenuButton = "AccessibilityIdentifierShowMenuButtonInGame"
    }
    
    enum Statistics {
        static let menuButton = "AccessibilityIdentifierMenuButtonInStatistics"
    }
}
