//
//  FetchHighestUnlockedLevel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import Foundation

protocol FetchHighestUnlockedLevelUseCase {
    func execute(fallbackLevel: Int,
                 completion: @escaping (Int) -> Void)
}

final class DefaultFetchHighestUnlockedLevelUseCase: FetchHighestUnlockedLevelUseCase {
    private let gameRepository: GameRepository

    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    
    func execute(fallbackLevel: Int,
                 completion: @escaping (Int) -> Void) {
        gameRepository.fetchHighestUnlockedLevel(fallbackLevel: fallbackLevel, completion: completion)
    }
}
