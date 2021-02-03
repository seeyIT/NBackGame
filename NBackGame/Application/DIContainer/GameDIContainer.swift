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
        return LevelSelectionViewModel(actions: actions, repository: makeGameRepository())
    }
    
    // MARK: - Game
    func makeGameView(nBack: Int, actions: GameViewModelActions) -> GameView {
        return GameView(viewModel: makeGameViewModel(nBack: nBack, actions: actions))
    }
    
    func makeGameViewModel(nBack: Int, actions: GameViewModelActions) -> GameViewModel {
        return GameViewModel(nBack: nBack, actions: actions)
    }
    
    // MARK: - Summary
    func makeGameSummaryView(gameInfo: GameInfo, actions: GameSummaryViewModelActions) -> GameSummaryView {
        return GameSummaryView(viewModel: makeGameSummaryViewModel(gameInfo: gameInfo, actions: actions))
    }
    
    func makeGameSummaryViewModel(gameInfo: GameInfo, actions: GameSummaryViewModelActions) -> GameSummaryViewModel {
        return GameSummaryViewModel(gameInfo: gameInfo, actions: actions, repository: makeGameRepository())
    }
    
    // MARK: - Repository
    
    func makeGameRepository() -> GameRepository {
        return GameRepository()
    }
    
}
