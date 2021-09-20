//
//  GameRepository.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 03/02/2021.
//

import Foundation

protocol GameRepository {
    func getHighestUnlockedLevel(completion: @escaping (Int?) -> Void)
    func saveUnlockedLevel(_ unlockedLevel: UnlockedLevelRealm, completion: @escaping (Result<Int, Error>) -> Void)
    func saveGameHistory(_ gameHistory: GameHistoryRealm, completion: @escaping (Result<Int, Error>) -> Void)
}

class RealmGameRepository: GameRepository {
    // TODO Inject data source
    private var realmService: RealmService = RealmService()
    
    func getHighestUnlockedLevel(completion: @escaping (Int?) -> Void) {
        let level = realmService.instance
            .objects(UnlockedLevelRealm.self)
            .sorted(byKeyPath: "level")
            .last?
            .level
        completion(level)
    }
    
    func saveUnlockedLevel(_ unlockedLevel: UnlockedLevelRealm,
                           completion: @escaping (Result<Int, Error>) -> Void) {
        do {
            try realmService.instance.write {
                realmService.instance.add(unlockedLevel)
            }
            completion(.success(unlockedLevel.level))
        } catch {
            print("Error: \(error)")
            completion(.failure(error))
        }
    }
    
    func saveGameHistory(_ gameHistory: GameHistoryRealm,
                         completion: @escaping (Result<Int, Error>) -> Void) {
        do {
            try realmService.instance.write {
                realmService.instance.add(gameHistory)
            }
            completion(.success(0))
        } catch {
            print("Error: \(error)")
            completion(.failure(error))
        }
    }
}

enum GameRepositoryError: Error {
    case levelAlreadyUnlocked(Int)
    case gameHistoryNotAdded(String)
    
    var description: String {
        switch self {
        case .levelAlreadyUnlocked(let level):
            return "Level \(level) is already unlocked."
        case .gameHistoryNotAdded(let error):
            return "Can't add game history item becasue: \(error)"
        }
    }
}
