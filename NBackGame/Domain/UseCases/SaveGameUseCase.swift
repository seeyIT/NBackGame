//
//  SaveGameUseCase.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 19/09/2021.
//

import Foundation

protocol SaveGameUseCase {
    func execute(gameInfo: GameInfo,
                 completion: @escaping (Result<Int, Error>) -> Void)
}

final class DefaultSaveGameUseCase: SaveGameUseCase {
    private let gameRepository: GameRepository
    
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    
    func execute(gameInfo: GameInfo, completion: @escaping (Result<Int, Error>) -> Void) {
        let gameHistory = GameHistoryRealm(history: gameInfo.history, level: gameInfo.level, startTime: gameInfo.startTime, endTime: gameInfo.endTime)
        
        gameRepository.saveGameHistory(gameHistory, completion: completion)
    }
    
}
