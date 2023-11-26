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
    let getHighestUnlockedLevelUseCase: GetHighestUnlockedLevelUseCase
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
    
    let gameCoordinator: GameCoordinator
    let useCases: GameSummaryViewModelUseCases
    let gameInfo: GameInfo
    
    init(gameCoordinator: GameCoordinator,
         gameInfo: GameInfo,
         useCases: GameSummaryViewModelUseCases) {
        self.gameCoordinator = gameCoordinator
        self.useCases = useCases
        self.gameInfo = gameInfo
    }
    
    // MARK: - Public functions
    
    func onAppear() {
//        log("GameSummary onAppear")
        useCases.calculateGameResultUseCase.execute(history: gameInfo.history, level: gameInfo.level) { gameResults in
            self.gameResults = gameResults
            self.saveGame()
            
            DispatchQueue.global().async {
                if !self.canUnlockNextLevel(for: gameResults) {
                    print("Can't try to unlock next level becasue user made mistake")
                    return
                }
                
                self.useCases.getHighestUnlockedLevelUseCase.execute { heightestLevel in
                    if self.gameInfo.level >= heightestLevel ?? -1 {
                        self.useCases.unlockNextLevelUseCase.execute(level: self.gameInfo.level) { result in
                            switch result {
                            case .success(let level):
                                print("Level \(level) unlocked successfully")
                            case .failure(let error):
                                print("Fail unlocking next level: \(error)")
                            }
                        }
                    } else {
                        print("Don't unlock next level becasue next level is unlocked already")
                    }
                    
                }
                
            }
        }
    }
    
    func showMenu() {
//        log("GameSummary showMenu")
        gameCoordinator.showMenu()
    }
    
    func playAgain() {
//        log("GameSummary playAgain")
        gameCoordinator.playAgain()
    }
    
    private func saveGame() {
        DispatchQueue.global().async {
            self.useCases.saveGameUseCase.execute(gameInfo: self.gameInfo, gameResults: self.gameResults) { result in
                switch result {
                case .success:
                    print("Game saved successfully")
                case .failure(let error):
                    print("Error saving game: \(error)")
                }
            }
        }
    }
    
    // MARK: - Private functions
    
    private func canUnlockNextLevel(for gameResults: GameResults) -> Bool {
        return gameResults.missedSelectionSound == 0 &&
            gameResults.missedSelectionPosition == 0 &&
            gameResults.incorrectSelectionSound == 0 &&
            gameResults.incorrectSelectionPosition == 0
    }
}
