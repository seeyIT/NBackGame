//
//  GameSummaryViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/11/2020.
//

import Foundation


class GameSummaryViewModel {
    var correctSelectionPostion = 0
    var correctSelectionSound = 0
    var incorrectSelectionPosition = 0
    var incorrectSelectionSound = 0
    var missedSelectionPosition = 0
    var missedSelectionSound = 0
    
    private var history: [HistoryItem]
    private var nBack: Int

    let gameInfo: GameInfo
    let actions: GameSummaryViewModelActions
    
    init(gameInfo: GameInfo, actions: GameSummaryViewModelActions) {
        self.gameInfo = gameInfo
        self.actions = actions
        self.history = gameInfo.history
        self.nBack = gameInfo.nBack
        calculateResults()
    }
    
    // MARK: - Public functions
    
    func playAgain() {
        actions.playAgain()
    }
    
    func showMenu() {
        actions.showMenu()
    }
    
    // MARK: - Private functions
    
    private func calculateResults() {
        for i in stride(from: history.count - 1, through: nBack, by: -1)  {
            let currentItem = history[i]
            let previousItem = history[i - nBack]
            
            if currentItem.position == previousItem.position {
                if currentItem.positionClicked {
                    correctSelectionPostion += 1
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
    }
}
