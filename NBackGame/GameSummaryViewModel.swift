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
    
    var history: [HistoryItem]
    var nBack: Int
    
    init(history: [HistoryItem], nBack n: Int) {
        self.history = history
        self.nBack = n
        print("GameSummaryViewModel init")
        calculateResults()
    }
    
    private func calculateResults() {
        for i in stride(from: history.count - 1, through: nBack, by: -1)  {
            print("i: \(i)")
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
