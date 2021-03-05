//
//  GameSummaryViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/11/2020.
//

import SwiftUI
import Combine

class GameSummaryViewModel: ObservableObject {
    @Published var gameResultCalculated = false
    @Published var correctSelectionPosition = 0
    @Published var correctSelectionSound = 0
    @Published var incorrectSelectionPosition = 0
    @Published var incorrectSelectionSound = 0
    @Published var missedSelectionPosition = 0
    @Published var missedSelectionSound = 0
    
    let gameInfo: GameInfo
    let actions: GameSummaryViewModelActions
    let repository: GameRepository
    
    init(gameInfo: GameInfo, actions: GameSummaryViewModelActions, repository: GameRepository) {
        self.gameInfo = gameInfo
        self.actions = actions
        self.repository = repository
    }
    
    // MARK: - Public functions
    
    func onAppear() {
        // TODO: - Do it in background
        self.calculateResults(history: self.gameInfo.history, nBack: self.gameInfo.nBack)
        self.unlockNextLevel()
    }
    
    func playAgain() {
        actions.playAgain()
    }
    
    func showMenu() {
        actions.showMenu()
    }
    
    // MARK: - Private functions
    
    private func calculateResults(history: [HistoryItem], nBack: Int) {
        for i in stride(from: history.count - 1, through: nBack, by: -1)  {
            let currentItem = history[i]
            let previousItem = history[i - nBack]
            
            if currentItem.position == previousItem.position {
                if currentItem.positionClicked {
                    correctSelectionPosition += 1
                } else {
                    missedSelectionPosition += 1
                }
            } else {
                if currentItem.positionClicked {
                    incorrectSelectionPosition += 1
                }
            }
            
            if currentItem.sound == previousItem.sound {
                if currentItem.soundClicked {
                    correctSelectionSound += 1
                } else {
                    missedSelectionSound += 1
                }
            } else {
                if currentItem.soundClicked {
                    incorrectSelectionSound += 1
                }
            }
        }
        
        gameResultCalculated = true
    }
    
    func canUnlockNextLevel() -> Bool {
        return missedSelectionSound == 0 &&
            missedSelectionPosition == 0 &&
            incorrectSelectionSound == 0 &&
            incorrectSelectionPosition == 0
    }
    
    private func unlockNextLevel() {
        DispatchQueue.global().async {
            if self.canUnlockNextLevel() {
                self.repository.saveUnlocked(level: self.gameInfo.nBack + 1)
            }
        }
    }
}
