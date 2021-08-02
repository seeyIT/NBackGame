//
//  MainViewCoordinator.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI

struct MainViewCoordinator: View {
    
    let menuDIContainer: MenuDIContainer
    @ObservedObject var menuViewState: ViewState<MenuViewState>
    
    var body: some View {
        if menuViewState.state == .menu {
            menuDIContainer.makeMenuView(menuViewState: menuViewState)
        } else if menuViewState.state == .game {
            menuDIContainer.makeGameView(menuViewState: menuViewState)
        } else if menuViewState.state == .tutorial {
            menuDIContainer.makeTutorialView()
        } else {
            EmptyView()
        }
    }
}
