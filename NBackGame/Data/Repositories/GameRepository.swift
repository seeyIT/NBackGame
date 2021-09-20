//
//  GameRepository.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 03/02/2021.
//

import Foundation

protocol GameRepository {
    func fetchHighestUnlockedLevel(completion: @escaping (Int?) -> Void)
    func saveUnlocked(level: Int, completion: @escaping (Result<Int, Error>) -> Void)
    func sameGame(gameHistory: GameHistoryRealm, completion: @escaping (Result<Int, Error>) -> Void)
}

class RealmGameRepository: GameRepository {
    // TODO Inject data source
    private var realmService: RealmService = RealmService()

    func fetchHighestUnlockedLevel(completion: @escaping (Int?) -> Void) {
        let level = realmService.instance
            .objects(UnlockedLevelRealm.self)
            .sorted(byKeyPath: "level")
            .last?
            .level
        completion(level)
    }
    
    func saveUnlocked(level: Int,
                      completion: @escaping (Result<Int, Error>) -> Void) {
        do {
            let previousUnlockedHigherLevels = realmService.instance.objects(UnlockedLevelRealm.self).filter("level >= %@", level)
            if previousUnlockedHigherLevels.isEmpty {
                let defaultUnlockedLevel = UnlockedLevelRealm(level: level)
                try realmService.instance.write {
                    realmService.instance.add(defaultUnlockedLevel)
                }
                completion(.success(level))
            } else {
                completion(.failure(GameRepositoryError.levelAlreadyUnlocked(level)))
            }
        } catch {
            print("Error: \(error)")
            completion(.failure(error))
        }
    }
    
    func sameGame(gameHistory: GameHistoryRealm,
                  completion: @escaping (Result<Int, Error>) -> Void) {
        do {
            try realmService.instance.write {
                realmService.instance.add(gameHistory)
            }
            completion(.success(0))
        } catch {
            print("Error: \(error)")
            completion(.failure(GameRepositoryError.gameHistoryNotAdded(error.localizedDescription)))
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
