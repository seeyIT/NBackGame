//
//  GameViewCoordinator.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI

struct GameViewCoordinator: View {
    let menuCoordinator: MenuViewCoordinator
    let gameDIContainer: GameDIContainer
    @StateObject var gameState: GameState<GameViewState> = GameState<GameViewState>(.levelSelection)
    
    var body: some View {
        if gameState.state == .levelSelection {
            gameDIContainer.makeLevelSelectionView(gameCoordinator: self)
        } else if gameState.state == .game {
            gameDIContainer.makeGameView(gameCoordinator: self, level: gameState.gameInfo.level)
        } else if gameState.state == .summary {
            gameDIContainer.makeGameSummaryView(gameCoordinator: self, gameInfo: gameState.gameInfo)
        } else {
            EmptyView()
        }
    }
}

extension GameViewCoordinator {

    func showMenu() {
        menuCoordinator.showMenu()
    }
    
    func showLevelSelection() {
        gameState.state = .levelSelection
    }
    
    func selectLevel(_ level: Int) {
        gameState.gameInfo.level = level
        withAnimation {
            gameState.state = .game
        }
    }
    
    func playAgain() {
        gameState.gameInfo.history.removeAll()
        withAnimation {
            gameState.state = .game
        }
    }
    
    func showGameSummary() {
        gameState.state = .summary
    }
}
