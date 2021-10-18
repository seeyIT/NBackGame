//
//  MenuViewCoordinator.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI
import Combine

class MenuViewCoordinator: ObservableObject {
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

struct MenuViewCoordinatorView: View {
    @ObservedObject var menuCoordinator: MenuViewCoordinator
    var gameCooridator: GameViewCoordinator
    let menuDIContainer: MenuDIContainer
    
    init(menuDIContainer: MenuDIContainer, menuCoordinator: MenuViewCoordinator, gameCoordinator: GameViewCoordinator) {
        self.menuDIContainer = menuDIContainer
        self.menuCoordinator = menuCoordinator
        self.gameCooridator = gameCoordinator
    }
    
    var body: some View {
        VStack {
            if menuCoordinator.menuViewState == .menu {
                menuDIContainer.makeMenuView(menuCoordinator: menuCoordinator)
            } else if menuCoordinator.menuViewState == .game {
                menuDIContainer.makeGameView(gameViewCoordinator: gameCooridator)
            } else if menuCoordinator.menuViewState == .tutorial {
                menuDIContainer.makeTutorialView(menuCoordinator: menuCoordinator)
            } else if menuCoordinator.menuViewState == .statistics {
                menuDIContainer.makeStatisticsView(menuCoordinator: menuCoordinator)
            } else {
                EmptyView()
            }
        }
    }
}
