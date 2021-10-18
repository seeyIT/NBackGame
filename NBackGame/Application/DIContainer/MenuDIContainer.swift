//
//  MenuDIContainer.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import Foundation

final class MenuDIContainer {
    
    struct Dependencies {
        let musicService: MusicService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Menu
    func makeMenuView(menuCoordinator: MenuCoordinator) -> MenuView {
        return MenuView(viewModel: makeMenuViewModel(menuCoordinator: menuCoordinator))
    }
    
    func makeMenuViewModel(menuCoordinator: MenuCoordinator) -> MenuViewModel {
        return MenuViewModel(menuCoordinator: menuCoordinator, musicService: dependencies.musicService)
    }
    
    // MARK: - Tutorial
    func makeTutorialView(menuCoordinator: MenuCoordinator) -> TutorialView {
        return TutorialView(viewModel: makeTutorialViewModel(menuCoordinator: menuCoordinator))
    }
    
    func makeTutorialViewModel(menuCoordinator: MenuCoordinator) -> TutorialViewModel {
        return TutorialViewModel(menuCoordinator: menuCoordinator)
    }
    
    // MARK: - Game
    func makeGameView(gameCoordinator: GameCoordinator) -> GameCoordinatorView {
        return GameCoordinatorView(gameCoordinator: gameCoordinator, gameDIContainer: makeGameDIContainer())
    }
    
    func makeGameDIContainer() -> GameDIContainer {
        let dependencies = GameDIContainer.Dependencies(musicService: dependencies.musicService)
        return GameDIContainer(dependencies: dependencies)
    }
    
    // MARK: - Statistics
    func makeStatisticsView(menuCoordinator: MenuCoordinator) -> StatisticsView {
        return StatisticsView(viewModel: makeStatisticsViewModel(menuCoordinator: menuCoordinator))
    }
    
    func makeStatisticsViewModel(menuCoordinator: MenuCoordinator) -> StatisticsViewModel {
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
