//
//  UnlockedLevelRealm.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 03/02/2021.
//

import Foundation
import RealmSwift

class UnlockedLevelRealm: Object {
    @objc dynamic var uuid: String = ""
    @objc dynamic var timestamp: Int64 = 0
    @objc dynamic var level: Int = 0
    @objc dynamic var deleted: Bool = false
    
    override class func primaryKey() -> String? {
        "uuid"
    }
    
    init(uuid: String = UUID().uuidString, timestamp: Int64 = getTimestamp(), level: Int, deleted: Bool = false) {
        self.uuid = uuid
        self.timestamp = timestamp
        self.level = level
        self.deleted = deleted
    }
    
    required override init() {
        super.init()
    }
}

extension UnlockedLevelRealm {
    func toDomain() -> UnlockedLevel {
        return UnlockedLevel(uuid: uuid,
                             timestamp: timestamp,
                             level: level,
                             deleted: deleted)
    }
}
