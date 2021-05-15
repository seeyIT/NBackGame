//
//  GameViewCoordinator.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI

struct GameViewCoordinator: View {
    let gameDIContainer: GameDIContainer
    @StateObject var gameState: GameState<GameViewState> = GameState<GameViewState>(.levelSelection)
    @ObservedObject var menuViewState: ViewState<MenuViewState>
    
    var body: some View {
        if gameState.state == .levelSelection {
            gameDIContainer.makeLevelSelectionView(actions: makeActionsForLevelSelection())
        } else if gameState.state == .game {
            gameDIContainer.makeGameView(level: gameState.gameInfo.level, actions: makeActionsForGame())
        } else if gameState.state == .summary {
            gameDIContainer.makeGameSummaryView(gameInfo: gameState.gameInfo, actions: makeActionsForGameSummary())
        } else {
            EmptyView()
        }
    }
}

extension GameViewCoordinator {
    func makeActionsForLevelSelection() -> LevelSelectionViewModelActions {
        let actions = DefaultLevelSelectionViewModelActions(selectLevel: selectLevel, showMenu: showMenu)
        return actions
    }
    
    func makeActionsForGame() -> GameViewModelActions {
        let actions = DefaultGameViewModelActions(finishGame: finishGame, showMenu: showMenu)
        return actions
    }
    
    func makeActionsForGameSummary() -> GameSummaryViewModelActions {
        let actions = DefaultGameSummaryViewModelActions(playAgain: playAgain, showMenu: showMenu)
        return actions
    }
    
    private func selectLevel(_ level: Int) {
        gameState.gameInfo.level = level
        withAnimation {
            gameState.state = .game
        }
    }
    
    private func finishGame(history: [HistoryItem]) {
        gameState.gameInfo.history = history
        withAnimation {
            gameState.state = .summary
        }
    }
    
    private func playAgain() {
        gameState.gameInfo.history.removeAll()
        withAnimation {
            gameState.state = .game
        }
    }
    
    private func showMenu() {
        withAnimation {
            menuViewState.state = .menu
        }
    }
}
