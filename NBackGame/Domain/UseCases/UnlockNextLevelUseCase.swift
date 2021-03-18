//
//  UnlockNextLevelUseCase.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 11/03/2021.
//

import Foundation

protocol UnlockNextLevelUseCase {
    func execute(level: Int,
                 gameResults: GameResults,
                 completion: @escaping (Result<Int, Error>) -> Void)
}

final class DefaultUnlockNextLevelUseCase: UnlockNextLevelUseCase {
    private let gameRepository: GameRepository
    
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    
    func execute(level: Int,
                 gameResults: GameResults,
                 completion: @escaping (Result<Int, Error>) -> Void) {
        if canUnlockNextLevel(for: gameResults) {
            gameRepository.saveUnlocked(level: level) { result in
                completion(result)
            }
        } else {
            completion(.failure(UnlockNextLevelUseCaseError.cantUnlockNextLevel(level)))
        }
        
    }
    
    private func canUnlockNextLevel(for gameResults: GameResults) -> Bool {
        return gameResults.missedSelectionSound == 0 &&
            gameResults.missedSelectionPosition == 0 &&
            gameResults.incorrectSelectionSound == 0 &&
            gameResults.incorrectSelectionPosition == 0
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
