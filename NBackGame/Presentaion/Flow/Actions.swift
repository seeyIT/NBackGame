//
//  Actions.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import Foundation

protocol LevelSelectionViewModelActions {
    var selectLevel: (Int) -> Void  { get }
}

struct DefaultLevelSelectionViewModelActions: LevelSelectionViewModelActions {
    var selectLevel: (Int) -> Void
}

protocol GameViewModelActions {
    var finishGame: ([HistoryItem]) -> Void  { get }
}

struct DefaultGameViewModelActions: GameViewModelActions {
    var finishGame: ([HistoryItem]) -> Void
}

protocol GameSummaryViewModelActions {
    var playAgain: () -> Void { get }
    var showMenu: () -> Void { get }
}

struct DefaultGameSummaryViewModelActions: GameSummaryViewModelActions {
    var playAgain: () -> Void
    var showMenu: () -> Void
}
