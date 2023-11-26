//
//  LevelSelectionViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 23/11/2020.
//

import Foundation
import SwiftUI

struct LevelSelectionViewModelUseCases {
    let getHighestUnlockedLevelUseCase: GetHighestUnlockedLevelUseCase
}

class LevelSelectionViewModel: ObservableObject {
    let gameCoordinator: GameCoordinator
    let defaultLevelUnlocked: Int = 2
    var selectedLevel = 1
    
    @Published private(set) var unlockedLevels: Int = -1
    
    let useCases: LevelSelectionViewModelUseCases
    
    init(gameCoordinator: GameCoordinator, useCases: LevelSelectionViewModelUseCases) {
        self.useCases = useCases
        self.gameCoordinator = gameCoordinator
    }
    
    func onAppear() {
//        log("Level selection onAppear")
        self.useCases.getHighestUnlockedLevelUseCase.execute { result in
            self.unlockedLevels = result ?? self.defaultLevelUnlocked
        }
    }
    
    func selectLevel(_ level: Int) {
//        log("Level selection select level: \(level)")
        selectedLevel = level
        if level <= unlockedLevels {
            gameCoordinator.selectLevel(level)
        }
    }
    
    func showMenu() {
        gameCoordinator.showMenu()
    }
}
