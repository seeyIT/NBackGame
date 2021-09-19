//
//  MenuDIContainer.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import Foundation

final class MenuDIContainer {
    
    // MARK: - Menu
    func makeMenuView(menuCoordinator: MenuViewCoordinator) -> MenuView {
        return MenuView(viewModel: makeMenuViewModel(menuCoordinator: menuCoordinator))
    }
    
    func makeMenuViewModel(menuCoordinator: MenuViewCoordinator) -> MenuViewModel {
        return MenuViewModel(menuCoordinator: menuCoordinator)
    }
    
    // MARK: - Tutorial
    func makeTutorialView(menuCoordinator: MenuViewCoordinator) -> TutorialView {
        return TutorialView(viewModel: makeTutorialViewModel(menuCoordinator: menuCoordinator))
    }
    
    func makeTutorialViewModel(menuCoordinator: MenuViewCoordinator) -> TutorialViewModel {
        return TutorialViewModel(menuCoordinator: menuCoordinator)
    }
    
    // MARK: - Game
    func makeGameView(menuCoordinator: MenuViewCoordinator) -> GameViewCoordinator {
        return GameViewCoordinator(menuCoordinator: menuCoordinator, gameDIContainer: makeGameDIContainer())
    }
    
    func makeGameDIContainer() -> GameDIContainer {
        return GameDIContainer()
    }
}
