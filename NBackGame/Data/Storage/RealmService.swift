//
//  RealmService.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 03/02/2021.
//

import Foundation
import RealmSwift

class RealmService {
    var instance: Realm {
        // TODO Add handling when realm doesn't exist
        let realm = try? Realm()
        return realm!
    }
    
    func performMigration() {
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { _, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                    print("Perform Realm migration to v1")
                }
            })
        Realm.Configuration.defaultConfiguration = config
    }
}
