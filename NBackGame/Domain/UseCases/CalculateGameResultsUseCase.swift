//
//  CalculateGameResultsUseCase.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 11/03/2021.
//

import Foundation

protocol CalculateGameResultsUseCase {
    func execute(history: [HistoryItem],
                 level: Int,
                 completion: @escaping (GameResults) -> Void)
}

final class DefaultCalculateGameResultsUseCase: CalculateGameResultsUseCase {
    
    func execute(history: [HistoryItem],
                 level: Int,
                 completion: @escaping (GameResults) -> Void) {
        var gameResults = GameResults()
        for i in stride(from: history.count - 1, through: level, by: -1)  {
            let currentItem = history[i]
            let previousItem = history[i - level]
            
            if currentItem.position == previousItem.position {
                if currentItem.positionClicked {
                    gameResults.correctSelectionPosition += 1
                } else {
                    gameResults.missedSelectionPosition += 1
                }
            } else {
                if currentItem.positionClicked {
                    gameResults.incorrectSelectionPosition += 1
                }
            }
            
            if currentItem.sound == previousItem.sound {
                if currentItem.soundClicked {
                    gameResults.correctSelectionSound += 1
                } else {
                    gameResults.missedSelectionSound += 1
                }
            } else {
                if currentItem.soundClicked {
                    gameResults.incorrectSelectionSound += 1
                }
            }
        }
        gameResults.gameResultCalculated = true
        
        completion(gameResults)
    }
}
