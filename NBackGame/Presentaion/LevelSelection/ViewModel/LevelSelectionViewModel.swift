//
//  LevelSelectionViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 23/11/2020.
//

import Foundation
import SwiftUI

class LevelSelectionViewModel: ObservableObject {
    
    let actions: LevelSelectionViewModelActions
   
    var selectedLevel = 1
    private(set) var unlockedLevels = 5
    
    init(actions: LevelSelectionViewModelActions) {
        self.actions = actions
    }
    
    func selectLevel(_ level: Int) {
        print("select level: \(level)")
        selectedLevel = level
        if level <= unlockedLevels {
            actions.selectLevel(level)
        }
    }
    
}
