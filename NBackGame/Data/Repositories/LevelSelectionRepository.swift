//
//  LevelSelectionRepository.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 03/02/2021.
//

import Foundation

class LevelSelectionRepository {
    //TODO Inject data source
    private var realm: RealmService = RealmService()
    
    private let highestLevelFallback: Int = 3
    
    func fetchHighestLevel() -> Int {
        guard let highestLevel = realm.instance.objects(UnlockedLevelRealm.self).sorted(byKeyPath: "level").last?.level else { return highestLevelFallback }
        return highestLevel
    }
}
