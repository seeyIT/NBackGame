//
//  MenuCoordinator.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI
import Combine

class MenuCoordinator: ObservableObject {
    @Published var menuViewState: MenuViewState = .menu
    
    func showMenu() {
        menuViewState = .menu
    }
    
    func showGame() {
        menuViewState = .game
    }
    
    func showTutorial() {
        menuViewState = .tutorial
    }
    
    func showStatistics() {
        menuViewState = .statistics
    }
}

struct MenuCoordinatorView: View {
    @ObservedObject var menuCoordinator: MenuCoordinator
    var gameCoordinator: GameCoordinator
    let menuDIContainer: MenuDIContainer
    
    init(menuDIContainer: MenuDIContainer, menuCoordinator: MenuCoordinator, gameCoordinator: GameCoordinator) {
        self.menuDIContainer = menuDIContainer
        self.menuCoordinator = menuCoordinator
        self.gameCoordinator = gameCoordinator
    }
    
    var body: some View {
        switch menuCoordinator.menuViewState {
        case .menu:
            menuDIContainer.makeMenuView(menuCoordinator: menuCoordinator)
        case .game:
            menuDIContainer.makeGameView(gameCoordinator: gameCoordinator)
        case .tutorial:
            menuDIContainer.makeTutorialView(menuCoordinator: menuCoordinator)
        case .statistics:
            menuDIContainer.makeStatisticsView(menuCoordinator: menuCoordinator)
        }
    }
}
