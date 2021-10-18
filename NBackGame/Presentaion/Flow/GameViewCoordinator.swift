//
//  GameViewCoordinator.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI

class GameViewCoordinator: ObservableObject {
    @Published var gameViewState: GameViewState = .levelSelection
    let menuCoordinator: MenuViewCoordinator
    var gameInfo: GameInfo = GameInfo(history: [], level: 0)
    
    init(menuCoordinator: MenuViewCoordinator) {
        debugPrint("Init GameViewCoordinator")
        self.menuCoordinator = menuCoordinator
    }
    
    deinit {
        debugPrint("Deinit GameViewCoordinator")
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

struct GameViewCoordinatorView: View {
    @ObservedObject var gameViewCooridator: GameViewCoordinator

    let gameDIContainer: GameDIContainer
    
    var body: some View {
        if gameViewCooridator.gameViewState == .levelSelection {
            gameDIContainer.makeLevelSelectionView(gameCoordinator: gameViewCooridator)
        } else if gameViewCooridator.gameViewState == .game {
            gameDIContainer.makeGameView(gameCoordinator: gameViewCooridator)
        } else if gameViewCooridator.gameViewState == .summary {
            gameDIContainer.makeGameSummaryView(gameCoordinator: gameViewCooridator)
        } else {
            EmptyView()
        }
    }
}
