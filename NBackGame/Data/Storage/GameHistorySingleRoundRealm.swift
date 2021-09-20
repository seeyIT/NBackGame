//
//  GameHistorySingleRoundRealm.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 20/09/2021.
//

import Foundation
import RealmSwift

class GameHistorySingleRoundRealm: Object {
    @objc dynamic var uuid: String = ""
    @objc dynamic var roundNumber: Int = 0
    @objc dynamic var position: Int = 0
    @objc dynamic var sound: String = ""
    @objc dynamic var positionClicked: Bool = false
    @objc dynamic var soundClicked: Bool = false

    override class func primaryKey() -> String? {
        "uuid"
    }
    
    init(uuid: String = UUID().uuidString, roundNumber: Int, position: Int, sound: String, positionClicked: Bool, soundClicked: Bool) {
        self.uuid = uuid
        self.roundNumber = roundNumber
        self.position = position
        self.sound = sound
        self.positionClicked = positionClicked
        self.soundClicked = soundClicked
    }

    required override init() {
        super.init()
    }
    
}

extension GameHistorySingleRoundRealm {
    func toDomain() -> GameHistorySingleRound {
        return GameHistorySingleRound(uuid: uuid,
                                      roundNumber: roundNumber,
                                      position: position,
                                      sound: sound,
                                      positionClicked: positionClicked,
                                      soundClicked: soundClicked)
    }
}
