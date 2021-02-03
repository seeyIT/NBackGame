//
//  GameRepository.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 03/02/2021.
//

import Foundation

class GameRepository {
    //TODO Inject data source
    private var realmService: RealmService = RealmService()
    
    private let highestLevelFallback: Int = 2
    
    func fetchHighestUnlockedLevel() -> Int {
        guard let highestLevel = realmService.instance.objects(UnlockedLevelRealm.self).sorted(byKeyPath: "level").last?.level else { return highestLevelFallback }
        return highestLevel
    }
    
    func saveUnlocked(level: Int) {
        let defaultUnlockedLevel = UnlockedLevelRealm(level: level)
        do {
            try realmService.instance.write {
                realmService.instance.add(defaultUnlockedLevel)
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
