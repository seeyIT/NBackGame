//
//  MenuCoordinator.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI
import Combine

protocol MenuCoordinator {
    func showMenu()
    func showGame()
    func showTutorial()
    func showStatistics()
}

class DefaultMenuCoordinator: MenuCoordinator, ObservableObject {
    @Published var menuViewState: MenuViewState = .splashScreen
    
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
    @ObservedObject var menuCoordinator: DefaultMenuCoordinator
    var gameCoordinator: DefaultGameCoordinator
    let menuDIContainer: MenuDIContainer
    
    init(menuDIContainer: MenuDIContainer, menuCoordinator: DefaultMenuCoordinator, gameCoordinator: DefaultGameCoordinator) {
        self.menuDIContainer = menuDIContainer
        self.menuCoordinator = menuCoordinator
        self.gameCoordinator = gameCoordinator
    }
    
    var body: some View {
        switch menuCoordinator.menuViewState {
        case .splashScreen:
            menuDIContainer.makeSplashScreenView(menuCoordinator: menuCoordinator)
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
