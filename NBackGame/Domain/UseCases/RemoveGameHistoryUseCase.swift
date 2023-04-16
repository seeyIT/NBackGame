//
//  RemoveGameHistoryUseCase.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 16/04/2023.
//

import Foundation

protocol RemoveGameHistoryUseCase {
    func execute(uuid: String)
}

final class DefaultRemoveGameHistoryUseCase: RemoveGameHistoryUseCase {
    private let gameRepository: GameRepository
    
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    
    func execute(uuid: String) {
        gameRepository.removeGameHistory(uuid)
    }
}
