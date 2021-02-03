//
//  AppVersionRealm.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 03/02/2021.
//

import Foundation
import RealmSwift

class AppVersionRealm: Object {
    @objc dynamic var uuid: String = UUID().uuidString
    @objc dynamic var timestamp: Int64 = 0
    @objc dynamic var version: Int = 0
    
    override class func primaryKey() -> String? {
        "uuid"
    }
    
    init(uuid: String = UUID().uuidString, timestamp: Int64 = getTimestamp(), version: Int) {
        self.uuid = uuid
        self.timestamp = timestamp
        self.version = version
    }
    
    required init() {
        
    }
    
}

extension AppVersionRealm {
    func toDomain() -> AppVersion {
        return AppVersion(uuid: uuid, timestamp: timestamp, version: version)
    }
}
