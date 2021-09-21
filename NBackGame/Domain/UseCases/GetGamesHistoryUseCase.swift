//
//  GetGamesHistoryUseCase.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 20/09/2021.
//

import Foundation

protocol GetGamesHistoryUseCase {
    func execute(completion: @escaping ([GameHistory]) -> Void)
}

final class DefaultGetGamesHistoryUseCase: GetGamesHistoryUseCase {
    private let gameRepository: GameRepository
    
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    
    func execute(completion: @escaping ([GameHistory]) -> Void) {
        gameRepository.getGamesHistory(completion: completion)
    }
}
