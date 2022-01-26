//
//  GameDIContainer.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import Foundation

final class GameDIContainer {
    
    struct Dependencies {
        let musicService: MusicService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Level Selection
    func makeLevelSelectionView(gameCoordinator: GameCoordinator) -> LevelSelectionView {
        return LevelSelectionView(viewModel: makeLevelSelectionViewModel(gameCoordinator: gameCoordinator))
    }
    
    func makeLevelSelectionViewModel(gameCoordinator: GameCoordinator) -> LevelSelectionViewModel {
        return LevelSelectionViewModel(gameCoordinator: gameCoordinator, useCases: makeLevelSelectionViewModelUseCases())
    }
    
    // MARK: - Game
    func makeGameView(gameCoordinator: GameCoordinator) -> GameView {
        return GameView(viewModel: makeGameViewModel(gameCoordinator: gameCoordinator))
    }
    
    func makeGameViewModel(gameCoordinator: GameCoordinator) -> GameViewModel {
        return GameViewModel(gameCoordinator: gameCoordinator, musicService: dependencies.musicService)
    }
    
    // MARK: - Summary
    func makeGameSummaryView(gameCoordinator: GameCoordinator, gameInfo: GameInfo) -> GameSummaryView {
        return GameSummaryView(viewModel: makeGameSummaryViewModel(gameCoordinator: gameCoordinator, gameInfo: gameInfo))
    }
    
    func makeGameSummaryViewModel(gameCoordinator: GameCoordinator, gameInfo: GameInfo) -> GameSummaryViewModel {
        return GameSummaryViewModel(gameCoordinator: gameCoordinator, gameInfo: gameInfo, useCases: makeGameSummaryViewModelUseCases())
    }
    
    // MARK: - Repository
    
    func makeGameRepository() -> GameRepository {
        return RealmGameRepository()
    }
    
    // MARK: - UseCase
    func makeLevelSelectionViewModelUseCases() -> LevelSelectionViewModelUseCases {
        let getHighestUnlockedLevelUseCase: GetHighestUnlockedLevelUseCase = DefaultGetHighestUnlockedLevelUseCase(gameRepository: makeGameRepository())
        
        let levelSelectionViewModelUseCases = LevelSelectionViewModelUseCases(getHighestUnlockedLevelUseCase: getHighestUnlockedLevelUseCase)
        
        return levelSelectionViewModelUseCases
    }
    
    func makeGameSummaryViewModelUseCases() -> GameSummaryViewModelUseCases {
        let calculateGameResultUseCase: CalculateGameResultsUseCase = DefaultCalculateGameResultsUseCase()
        let unlockNextLevelUseCase: UnlockNextLevelUseCase = DefaultUnlockNextLevelUseCase(gameRepository: makeGameRepository())
        let saveGameUseCase: SaveGameUseCase = DefaultSaveGameUseCase(gameRepository: makeGameRepository())
        let getHighestUnlockedLevelUseCase: GetHighestUnlockedLevelUseCase = DefaultGetHighestUnlockedLevelUseCase(gameRepository: makeGameRepository())
        
        let gameSummaryViewModelUseCases = GameSummaryViewModelUseCases(calculateGameResultUseCase: calculateGameResultUseCase,
                                                                        unlockNextLevelUseCase: unlockNextLevelUseCase,
                                                                        getHighestUnlockedLevelUseCase: getHighestUnlockedLevelUseCase,
                                                                        saveGameUseCase: saveGameUseCase)
        
        return gameSummaryViewModelUseCases
    }
    
}
