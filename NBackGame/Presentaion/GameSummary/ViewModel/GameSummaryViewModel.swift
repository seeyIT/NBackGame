//
//  GameSummaryViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/11/2020.
//

import SwiftUI
import Combine

struct GameSummaryViewModelUseCases {
    let calculateGameResult: CalculateGameResultsUseCase
    let unlockNextLevelUseCase: UnlockNextLevelUseCase
}

struct GameResults {
    var gameResultCalculated = false
    var correctSelectionPosition: Int = 0
    var correctSelectionSound: Int = 0
    var incorrectSelectionPosition: Int = 0
    var incorrectSelectionSound: Int = 0
    var missedSelectionPosition: Int = 0
    var missedSelectionSound: Int = 0
}

class GameSummaryViewModel: ObservableObject {
    @Published var gameResults = GameResults()
    
    let gameInfo: GameInfo
    let useCases: GameSummaryViewModelUseCases
    
    init(gameInfo: GameInfo, useCases: GameSummaryViewModelUseCases) {
        self.gameInfo = gameInfo
        self.useCases = useCases
    }
    
    // MARK: - Public functions
    
    func onAppear() {
        useCases.calculateGameResult.execute(history: gameInfo.history, level: gameInfo.level) { gameResults in
            self.gameResults = gameResults
            
            DispatchQueue.global().async {
                self.useCases.unlockNextLevelUseCase.execute(level: self.gameInfo.level + 1, gameResults: self.gameResults) { result in
                    switch result {
                    case .success(let levelUnlocked):
                        print("Level \(levelUnlocked) unlocked")
                    case .failure(let error as UnlockNextLevelUseCaseError):
                        print("Error unlocking level: \(error.description)")
                    case .failure(let error as GameRepositoryError):
                        print("Error in repository unlocking level: \(error.description)")
                    case .failure(let error):
                        print("Other error unlocking level: \(error)")
                    }
                }
            }
        }
    }
}
