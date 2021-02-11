//
//  AccessibilityIdentifier.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 11/02/2021.
//

import Foundation

struct AccessibilityIdentifier {
    struct Menu {
        static let playButton = "AccessibilityIdentifierPlayButtonInMenu"
        static let tutorialButton = "AccessibilityIdentifierTutorialButtonInMenu"
    }
    
    struct LevelSelection {
        static let levelPrefixButton = "AccessibilityIdentifierLevelPrefixButtonInLevelSelection"
    }
    
    struct Game {
        static let fieldNumberPrefixButton = "AccessibilityIdentifierFieldNumberPrefixButtonInGame"
        static let positionButton = "AccessibilityIdentifierPositionButtonInGame"
        static let soundButton = "AccessibilityIdentifierSoundButtonInGame"
        
    }
    
    struct GameSummary {
        static let playAgainButton = "AccessibilityIdentifierPlayAgainButtonInGameSummary"
        static let menuButton = "AccessibilityIdentifierMenuButtonInGameSummary"
        
        static let correctSelectionPositionText = "AccessibilityIdentifierCorrectSelectionPositionTextInGameSummary"
        static let incorrectSelectionPositionText = "AccessibilityIdentifierIncorrectSelectionPositionTextInGameSummary"
        static let missedSelectionPositionText = "AccessibilityIdentifierMissedSelectionPositionTextInGameSummary"
        static let correctSelectionSoundText = "AccessibilityIdentifierCorrectSelectionSoundTextInGameSummary"
        static let incorrectSelectionSoundText = "AccessibilityIdentifierIncorrectSelectionSoundInGameSummary"
        static let missedSelectionSoundText = "AccessibilityIdentifierMissedSelectionSoundInGameSummary"
        
    }
    
    struct Tutorial {
        static let nextButton = "AccessibilityIdentifierNextButtonInTutorial"
        static let previousButton = "AccessibilityIdentifierPreviousButtonInTutorial"
        static let menuButton = "AccessibilityIdentifierMenuButtonInTutorial"
    }
}
