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
    
    // MARK: - Statistics
    func makeStatisticsView(menuCoordinator: MenuViewCoordinator) -> StatisticsView {
        return StatisticsView(viewModel: makeStatisticsViewModel(menuCoordinator: menuCoordinator))
    }
    
    func makeStatisticsViewModel(menuCoordinator: MenuViewCoordinator) -> StatisticsViewModel {
        return StatisticsViewModel(menuCoordinator: menuCoordinator, useCases: makeStatisticsViewModelUseCases())
    }
    
    func makeStatisticsViewModelUseCases() -> StatisticsViewModelUseCases {
        let getGamesHistoryUseCase = DefaultGetGamesHistoryUseCase(gameRepository: makeGameRepository())
        
        return StatisticsViewModelUseCases(getGamesHistoryUseCase: getGamesHistoryUseCase)
    }
    
    // MARK: - Repository
    
    func makeGameRepository() -> GameRepository {
        return RealmGameRepository()
    }
}
