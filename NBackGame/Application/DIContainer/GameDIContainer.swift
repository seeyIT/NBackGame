//
//  GameDIContainer.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import Foundation

final class GameDIContainer {
    
    // MARK: - Level Selection
    func makeLevelSelectionView(gameCoordinator: GameViewCoordinator) -> LevelSelectionView {
        return LevelSelectionView(viewModel: makeLevelSelectionViewModel(gameCoordinator: gameCoordinator))
    }
    
    func makeLevelSelectionViewModel(gameCoordinator: GameViewCoordinator) -> LevelSelectionViewModel {
        return LevelSelectionViewModel(gameCoordinator: gameCoordinator, useCases: makeLevelSelectionViewModelUseCases())
    }
    
    // MARK: - Game
    func makeGameView(gameCoordinator: GameViewCoordinator, level: Int) -> GameView {
        return GameView(viewModel: makeGameViewModel(level: level, gameCoordinator: gameCoordinator))
    }
    
    func makeGameViewModel(level: Int, gameCoordinator: GameViewCoordinator) -> GameViewModel {
        return GameViewModel(level: level, gameCoordinator: gameCoordinator)
    }
    
    // MARK: - Summary
    func makeGameSummaryView(gameCoordinator: GameViewCoordinator, gameInfo: GameInfo) -> GameSummaryView {
        return GameSummaryView(gameCoordinator: gameCoordinator, viewModel: makeGameSummaryViewModel(gameInfo: gameInfo))
    }
    
    func makeGameSummaryViewModel(gameInfo: GameInfo) -> GameSummaryViewModel {
        return GameSummaryViewModel(gameInfo: gameInfo, useCases: makeGameSummaryViewModelUseCases())
    }
    
    // MARK: - Repository
    
    func makeGameRepository() -> GameRepository {
        return RealmGameRepository()
    }
    
    // MARK: - UseCase
    func makeLevelSelectionViewModelUseCases() -> LevelSelectionViewModelUseCases {
        let fetchHighestUnlockedLevelUseCase: FetchHighestUnlockedLevelUseCase = DefaultFetchHighestUnlockedLevelUseCase(gameRepository: makeGameRepository())
        
        let levelSelectionViewModelUseCases = LevelSelectionViewModelUseCases(fetchHighestUnlockedLevelUseCase: fetchHighestUnlockedLevelUseCase)
        
        return levelSelectionViewModelUseCases
    }
    
    func makeGameSummaryViewModelUseCases() -> GameSummaryViewModelUseCases {
        let calculateGameResultUseCase: CalculateGameResultsUseCase = DefaultCalculateGameResultsUseCase()
        let unlockNextLevelUseCase: UnlockNextLevelUseCase = DefaultUnlockNextLevelUseCase(gameRepository: makeGameRepository())
        
        let gameSummaryViewModelUseCases = GameSummaryViewModelUseCases(calculateGameResult: calculateGameResultUseCase,
                                                                        unlockNextLevelUseCase: unlockNextLevelUseCase)
        
        return gameSummaryViewModelUseCases
    }
    
}
