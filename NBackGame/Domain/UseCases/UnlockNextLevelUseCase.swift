//
//  UnlockNextLevelUseCase.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 11/03/2021.
//

import Foundation

protocol UnlockNextLevelUseCase {
    func execute(level: Int,
                 completion: @escaping (Result<Int, Error>) -> Void)
}

final class DefaultUnlockNextLevelUseCase: UnlockNextLevelUseCase {
    private let gameRepository: GameRepository
    
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    
    func execute(level: Int,
                 completion: @escaping (Result<Int, Error>) -> Void) {
        let nextLevel = 1
        let unlockedLevel = UnlockedLevelRealm(level: level + nextLevel)
        
        gameRepository.saveUnlockedLevel(unlockedLevel, completion: completion)
    }
}

enum UnlockNextLevelUseCaseError: Error {
    case cantUnlockNextLevel(Int)
    
    var description: String {
        switch self {
        case .cantUnlockNextLevel(let level):
            return "Can't unlock level \(level) because user made mistake"
        }
    }
}
