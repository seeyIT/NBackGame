//
//  MenuDIContainer.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import Foundation

final class MenuDIContainer {
    
    // MARK: - Menu
    func makeMenuView(menuViewState: ViewState<MenuViewState>) -> MenuView {
        return MenuView(viewModel: makeMenuViewModel(menuViewState: menuViewState))
    }
    
    func makeMenuViewModel(menuViewState: ViewState<MenuViewState>) -> MenuViewModel {
        return MenuViewModel(menuViewState: menuViewState)
    }
    
   
    // MARK: - Tutorial
    func makeTutorialView() -> TutorialView {
        return TutorialView(viewModel: makeTutorialViewModel())
    }
    
    func makeTutorialViewModel() -> TutorialViewModel {
        return TutorialViewModel()
    }
    
    
    // MARK: - Game
    func makeGameView(menuViewState: ViewState<MenuViewState>) -> GameViewCoordinator {
        return GameViewCoordinator(gameDIContainer: GameDIContainer(), menuViewState: menuViewState)
    }
}
