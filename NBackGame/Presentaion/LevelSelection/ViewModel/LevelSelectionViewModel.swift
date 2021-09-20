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
    static let defaultLevelUnlocked: Int = 2
    var selectedLevel = 1

    @Published private(set) var unlockedLevels = defaultLevelUnlocked
    
    let useCases: LevelSelectionViewModelUseCases
    
    init(gameCoordinator: GameViewCoordinator, useCases: LevelSelectionViewModelUseCases) {
        self.useCases = useCases
        self.gameCoordinator = gameCoordinator
    }
    
    func onAppear() {
        self.useCases.fetchHighestUnlockedLevelUseCase.execute { result in
            self.unlockedLevels = result ?? LevelSelectionViewModel.defaultLevelUnlocked
        }
    }
    
    func selectLevel(_ level: Int) {
        gameCoordinator.selectLevel(level)
    }
    
    func showMenu() {
        gameCoordinator.showMenu()
    }
}
