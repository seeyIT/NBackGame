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
    static let defaultLevelUnlocked: Int = 1
    var selectedLevel = 1

    @Published private(set) var unlockedLevels = defaultLevelUnlocked
    
    let useCases: LevelSelectionViewModelUseCases
    
    init(useCases: LevelSelectionViewModelUseCases) {
        self.useCases = useCases
    }
    
    func onAppear() {
        self.useCases.fetchHighestUnlockedLevelUseCase.execute(fallbackLevel: LevelSelectionViewModel.defaultLevelUnlocked) { result in
            self.unlockedLevels = result
        }
    }
    
}
