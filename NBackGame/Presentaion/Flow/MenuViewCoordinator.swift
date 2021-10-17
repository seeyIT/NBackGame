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
    let menuDIContainer: MenuDIContainer
    
    init(menuDIContainer: MenuDIContainer, menuCoordinator: MenuViewCoordinator) {
        self.menuDIContainer = menuDIContainer
        self.menuCoordinator = menuCoordinator
    }
    
    var body: some View {
        VStack {
            if menuCoordinator.menuViewState == .menu {
                menuDIContainer.makeMenuView(menuCoordinator: menuCoordinator)
            } else if menuCoordinator.menuViewState == .game {
                menuDIContainer.makeGameView(menuCoordinator: menuCoordinator)
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
