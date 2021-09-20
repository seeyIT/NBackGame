//
//  GameSummaryViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/11/2020.
//

import SwiftUI
import Combine

struct GameSummaryViewModelUseCases {
    let calculateGameResultUseCase: CalculateGameResultsUseCase
    let unlockNextLevelUseCase: UnlockNextLevelUseCase
    let saveGameUseCase: SaveGameUseCase
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
    
    let gameCoordinator: GameViewCoordinator
    let gameInfo: GameInfo
    let useCases: GameSummaryViewModelUseCases
    
    init(gameCoordinator: GameViewCoordinator, gameInfo: GameInfo, useCases: GameSummaryViewModelUseCases) {
        self.gameCoordinator = gameCoordinator
        self.gameInfo = gameInfo
        self.useCases = useCases
    }
    
    // MARK: - Public functions
    
    func onAppear() {
        saveGame()
        useCases.calculateGameResultUseCase.execute(history: gameInfo.history, level: gameInfo.level) { gameResults in
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
    
    func showMenu() {
        gameCoordinator.showMenu()
    }
    
    func playAgain() {
        gameCoordinator.playAgain()
    }
    
    private func saveGame() {
        DispatchQueue.global().async {
            self.useCases.saveGameUseCase.execute(gameInfo: self.gameInfo) { result in
                switch result {
                case .success:
                    print("Game saved successfully")
                case .failure(let error):
                    print("Error saving game: \(error)")
                }
            }
        }
    }
}
