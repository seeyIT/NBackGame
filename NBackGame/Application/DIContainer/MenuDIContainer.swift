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
        return MenuView(menuCoordinator: menuCoordinator, viewModel: makeMenuViewModel())
    }
    
    func makeMenuViewModel() -> MenuViewModel {
        return MenuViewModel()
    }
    
    // MARK: - Tutorial
    func makeTutorialView(menuCoordinator: MenuViewCoordinator) -> TutorialView {
        return TutorialView(menuCoordinator: menuCoordinator, viewModel: makeTutorialViewModel())
    }
    
    func makeTutorialViewModel() -> TutorialViewModel {
        return TutorialViewModel()
    }
    
    // MARK: - Game
    func makeGameView(menuCoordinator: MenuViewCoordinator) -> GameViewCoordinator {
        return GameViewCoordinator(menuCoordinator: menuCoordinator, gameDIContainer: makeGameDIContainer())
    }
    
    func makeGameDIContainer() -> GameDIContainer {
        return GameDIContainer()
    }
}
