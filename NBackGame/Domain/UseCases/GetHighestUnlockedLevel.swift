//
//  GetHighestUnlockedLevel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import Foundation

protocol GetHighestUnlockedLevelUseCase {
    func execute(completion: @escaping (Int?) -> Void)
}

final class DefaultGetHighestUnlockedLevelUseCase: GetHighestUnlockedLevelUseCase {
    private let gameRepository: GameRepository
    
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    
    func execute(completion: @escaping (Int?) -> Void) {
        gameRepository.fetchHighestUnlockedLevel(completion: completion)
    }
}
