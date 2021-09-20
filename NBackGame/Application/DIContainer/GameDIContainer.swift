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
    func makeGameView(gameCoordinator: GameViewCoordinator, gameInfo: GameInfo) -> GameView {
        return GameView(viewModel: makeGameViewModel(gameCoordinator: gameCoordinator, gameInfo: gameInfo))
    }
    
    func makeGameViewModel(gameCoordinator: GameViewCoordinator, gameInfo: GameInfo) -> GameViewModel {
        return GameViewModel(gameCoordinator: gameCoordinator, gameInfo: gameInfo)
    }
    
    // MARK: - Summary
    func makeGameSummaryView(gameCoordinator: GameViewCoordinator, gameInfo: GameInfo) -> GameSummaryView {
        return GameSummaryView(viewModel: makeGameSummaryViewModel(gameCoordinator: gameCoordinator, gameInfo: gameInfo))
    }
    
    func makeGameSummaryViewModel(gameCoordinator: GameViewCoordinator, gameInfo: GameInfo) -> GameSummaryViewModel {
        return GameSummaryViewModel(gameCoordinator: gameCoordinator, gameInfo: gameInfo, useCases: makeGameSummaryViewModelUseCases())
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
