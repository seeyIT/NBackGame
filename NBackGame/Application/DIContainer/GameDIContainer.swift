//
//  GameDIContainer.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import Foundation


final class GameDIContainer {
    
    // MARK: - Level Selection
    func makeLevelSelectionView(actions: LevelSelectionViewModelActions) -> LevelSelectionView {
        return LevelSelectionView(viewModel: makeLevelSelectionViewModel(actions: actions))
    }
    
    func makeLevelSelectionViewModel(actions: LevelSelectionViewModelActions) -> LevelSelectionViewModel {
        return LevelSelectionViewModel(actions: actions, useCases: makeLevelSelectionViewModelUseCases())
    }
    
    // MARK: - Game
    func makeGameView(level: Int, actions: GameViewModelActions) -> GameView {
        return GameView(viewModel: makeGameViewModel(level: level, actions: actions))
    }
    
    func makeGameViewModel(level: Int, actions: GameViewModelActions) -> GameViewModel {
        return GameViewModel(level: level, actions: actions)
    }
    
    // MARK: - Summary
    func makeGameSummaryView(gameInfo: GameInfo, actions: GameSummaryViewModelActions) -> GameSummaryView {
        return GameSummaryView(viewModel: makeGameSummaryViewModel(gameInfo: gameInfo, actions: actions))
    }
    
    func makeGameSummaryViewModel(gameInfo: GameInfo, actions: GameSummaryViewModelActions) -> GameSummaryViewModel {
        return GameSummaryViewModel(gameInfo: gameInfo, actions: actions, useCases: makeGameSummaryViewModelUseCases())
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
