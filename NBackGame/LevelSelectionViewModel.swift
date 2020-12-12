//
//  LevelSelectionViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 23/11/2020.
//

import Foundation
import Combine

class LevelSelectionViewModel: ObservableObject {
    
    @Published var nextScreen = false {
        didSet {
            print("old value: \(oldValue), \(nextScreen)")
        }
    }
    var selectedLevel = 1
    private(set) var unlockedLevels = 5

    func selectLevel(_ level: Int) {
        print("select level: \(level)")
        selectedLevel = level
        if level <= unlockedLevels {
            nextScreen = true

        }
    }
    
}
