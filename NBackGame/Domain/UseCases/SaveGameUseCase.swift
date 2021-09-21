//
//  SaveGameUseCase.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 19/09/2021.
//

import Foundation

protocol SaveGameUseCase {
    func execute(gameInfo: GameInfo,
                 gameResults: GameResults,
                 completion: @escaping (Result<Int, Error>) -> Void)
}

final class DefaultSaveGameUseCase: SaveGameUseCase {
    private let gameRepository: GameRepository
    
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    
    func execute(gameInfo: GameInfo, gameResults: GameResults, completion: @escaping (Result<Int, Error>) -> Void) {
        let gameHistory = GameHistoryRealm(history: gameInfo.history, level: gameInfo.level, startTime: gameInfo.startTime, endTime: gameInfo.endTime,
                                           correctSelectionPosition: gameResults.correctSelectionPosition, correctSelectionSound: gameResults.correctSelectionSound, incorrectSelectionPosition: gameResults.incorrectSelectionPosition, incorrectSelectionSound: gameResults.incorrectSelectionSound, missedSelectionPosition: gameResults.missedSelectionPosition, missedSelectionSound: gameResults.missedSelectionSound)
        
        gameRepository.saveGameHistory(gameHistory, completion: completion)
    }
}
