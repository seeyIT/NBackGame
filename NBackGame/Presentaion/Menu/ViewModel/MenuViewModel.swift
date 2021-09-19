//
//  MenuViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    let menuCoordinator: MenuViewCoordinator
    
    init(menuCoordinator: MenuViewCoordinator) {
        self.menuCoordinator = menuCoordinator
    }
    
    func showGame() {
        menuCoordinator.showGame()
    }
    
    func showTutorial() {
        menuCoordinator.showTutorial()
    }
}
