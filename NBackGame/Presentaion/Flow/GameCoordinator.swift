//
//  GameCoordinator.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI

class GameCoordinator: ObservableObject {
    @Published var gameViewState: GameViewState = .levelSelection
    let menuCoordinator: MenuCoordinator
    var gameInfo: GameInfo = GameInfo(history: [], level: 0)
    
    init(menuCoordinator: MenuCoordinator) {
        debugPrint("Init GameCoordinator")
        self.menuCoordinator = menuCoordinator
    }
    
    deinit {
        debugPrint("Deinit GameCoordinator")
    }
    
    func showMenu() {
        menuCoordinator.showMenu()
        gameViewState = .levelSelection
    }
    
    func showLevelSelection() {
        gameViewState = .levelSelection
    }
    
    func selectLevel(_ level: Int) {
        gameInfo.level = level
        gameViewState = .game
    }
    
    func playAgain() {
        gameInfo.history.removeAll()
        gameViewState = .game
    }
    
    func showGameSummary(gameInfo: GameInfo) {
        self.gameInfo = gameInfo
        gameViewState = .summary
    }
}

struct GameCoordinatorView: View {
    @ObservedObject var gameCoordinator: GameCoordinator

    let gameDIContainer: GameDIContainer
    
    var body: some View {
        if gameCoordinator.gameViewState == .levelSelection {
            gameDIContainer.makeLevelSelectionView(gameCoordinator: gameCoordinator)
        } else if gameCoordinator.gameViewState == .game {
            gameDIContainer.makeGameView(gameCoordinator: gameCoordinator)
        } else if gameCoordinator.gameViewState == .summary {
            gameDIContainer.makeGameSummaryView(gameCoordinator: gameCoordinator)
        } else {
            EmptyView()
        }
    }
}
