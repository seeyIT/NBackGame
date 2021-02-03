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
        return try! Realm()
    }
}
