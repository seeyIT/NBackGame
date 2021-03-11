//
//  GameRepository.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 03/02/2021.
//

import Foundation

protocol GameRepository {
    func fetchHighestUnlockedLevel() -> Int
    func saveUnlocked(level: Int, completion: @escaping (Result<Int, Error>) -> Void)
}

class RealmGameRepository: GameRepository {
    //TODO Inject data source
    private var realmService: RealmService = RealmService()
    
    private let highestLevelFallback: Int = 2
    
    func fetchHighestUnlockedLevel() -> Int {
        guard let highestLevel = realmService.instance.objects(UnlockedLevelRealm.self).sorted(byKeyPath: "level").last?.level else { return highestLevelFallback }
        return highestLevel
    }
    
    func saveUnlocked(level: Int,
                      completion: @escaping (Result<Int, Error>) -> Void) {
        let defaultUnlockedLevel = UnlockedLevelRealm(level: level)
        do {
            let previousUnlockedHigherLevels = realmService.instance.objects(UnlockedLevelRealm.self).filter("level >= %@", level)
            if previousUnlockedHigherLevels.isEmpty {
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
}


enum GameRepositoryError: Error {
    case levelAlreadyUnlocked(Int)
    
    var description: String {
        switch self {
        case .levelAlreadyUnlocked(let level):
            return "Level \(level) is already unlocked."
        }
    }
}
