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
        gameRepository.sameGame(gameInfo: gameInfo, completion: completion)
    }
    
}
