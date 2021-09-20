//
//  MenuViewCoordinator.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI

struct MenuViewCoordinator: View {
    
    let menuDIContainer: MenuDIContainer
    @ObservedObject var menuViewState: ViewState<MenuViewState>
    
    var body: some View {
        if menuViewState.state == .menu {
            menuDIContainer.makeMenuView(menuCoordinator: self)
        } else if menuViewState.state == .game {
            menuDIContainer.makeGameView(menuCoordinator: self)
        } else if menuViewState.state == .tutorial {
            menuDIContainer.makeTutorialView(menuCoordinator: self)
        } else if menuViewState.state == .statistics {
            menuDIContainer.makeStatisticsView(menuCoordinator: self)
        } else {
            EmptyView()
        }
    }
    
    func showMenu() {
        menuViewState.state = .menu
    }
    
    func showGame() {
        menuViewState.state = .game
    }
    
    func showTutorial() {
        menuViewState.state = .tutorial
    }
    
    func showStatistics() {
        menuViewState.state = .statistics
    }
}
