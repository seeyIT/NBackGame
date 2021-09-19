//
//  LevelSelectionViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 23/11/2020.
//

import Foundation
import SwiftUI

struct LevelSelectionViewModelUseCases {
    let fetchHighestUnlockedLevelUseCase: FetchHighestUnlockedLevelUseCase
}

class LevelSelectionViewModel: ObservableObject {
    let gameCoordinator: GameViewCoordinator
    static let defaultLevelUnlocked: Int = 1
    var selectedLevel = 1

    @Published private(set) var unlockedLevels = defaultLevelUnlocked
    
    let useCases: LevelSelectionViewModelUseCases
    
    init(gameCoordinator: GameViewCoordinator, useCases: LevelSelectionViewModelUseCases) {
        self.useCases = useCases
        self.gameCoordinator = gameCoordinator
    }
    
    func onAppear() {
        self.useCases.fetchHighestUnlockedLevelUseCase.execute(fallbackLevel: LevelSelectionViewModel.defaultLevelUnlocked) { result in
            self.unlockedLevels = result
        }
    }
    
    func selectLevel(_ level: Int) {
        gameCoordinator.selectLevel(level)
    }
    
    func showMenu() {
        gameCoordinator.showMenu()
    }
}
