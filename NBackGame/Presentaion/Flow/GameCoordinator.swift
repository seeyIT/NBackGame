//
//  GameCoordinator.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI

protocol GameCoordinator {
    func showMenu()
    func showLevelSelection()
    func selectLevel(_ level: Int)
    func playAgain()
    func showGameSummary(history: [HistoryItem], gameStartTime: Int64, gameEndTime: Int64)
    
    var gameInfo: GameInfo { get }
    var gameViewState: GameViewState { get }
}

class DefaultGameCoordinator: GameCoordinator, ObservableObject {
    @Published var gameViewState: GameViewState = .levelSelection
    let menuCoordinator: MenuCoordinator
    private(set) var gameInfo: GameInfo = GameInfo(history: [], level: 0)
    
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
    
    func showGameSummary(history: [HistoryItem], gameStartTime: Int64, gameEndTime: Int64) {
        gameInfo.history = history
        gameInfo.startTime = gameStartTime
        gameInfo.endTime = gameEndTime
        gameViewState = .summary
    }
}

struct GameCoordinatorView: View {
    @ObservedObject var gameCoordinator: DefaultGameCoordinator

    let gameDIContainer: GameDIContainer
    
    var body: some View {
        switch gameCoordinator.gameViewState {
        case .levelSelection:
            gameDIContainer.makeLevelSelectionView(gameCoordinator: gameCoordinator)
        case .game:
            gameDIContainer.makeGameView(gameCoordinator: gameCoordinator)
        case .summary:
            gameDIContainer.makeGameSummaryView(gameCoordinator: gameCoordinator, gameInfo: gameCoordinator.gameInfo)
        }
    }
}
