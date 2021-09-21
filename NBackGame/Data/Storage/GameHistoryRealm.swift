//
//  GameHistoryRealm.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 20/09/2021.
//

import Foundation
import RealmSwift

class GameHistoryRealm: Object {
    @objc dynamic var uuid: String = ""
    var history: List<GameHistorySingleRoundRealm> = List<GameHistorySingleRoundRealm>()
    @objc dynamic var level: Int = 0
    @objc dynamic var startTime: Int64 = 0
    @objc dynamic var endTime: Int64 = 0
    @objc dynamic var correctSelectionPosition: Int = 0
    @objc dynamic var correctSelectionSound: Int = 0
    @objc dynamic var incorrectSelectionPosition: Int = 0
    @objc dynamic var incorrectSelectionSound: Int = 0
    @objc dynamic var missedSelectionPosition: Int = 0
    @objc dynamic var missedSelectionSound: Int = 0
     
    override class func primaryKey() -> String? {
        "uuid"
    }
    
    init(uuid: String = UUID().uuidString,
         history: [HistoryItem],
         level: Int,
         startTime: Int64,
         endTime: Int64,
         correctSelectionPosition: Int,
         correctSelectionSound: Int,
         incorrectSelectionPosition: Int,
         incorrectSelectionSound: Int,
         missedSelectionPosition: Int,
         missedSelectionSound: Int) {
        self.uuid = uuid
        let newHistory = List<GameHistorySingleRoundRealm>()
        history.forEach {
            newHistory.append(GameHistorySingleRoundRealm(roundNumber: $0.roundNumber, position: $0.position, sound: $0.sound, positionClicked: $0.positionClicked, soundClicked: $0.soundClicked))
        }
        self.history = newHistory
        self.level = level
        self.startTime = startTime
        self.endTime = endTime
        self.correctSelectionPosition = correctSelectionPosition
        self.correctSelectionSound = correctSelectionSound
        self.incorrectSelectionPosition = incorrectSelectionPosition
        self.incorrectSelectionSound = incorrectSelectionSound
        self.missedSelectionPosition = missedSelectionPosition
        self.missedSelectionSound = missedSelectionSound
    }
    
    required override init() {
        super.init()
    }
    
}

extension GameHistoryRealm {
    func toDomain() -> GameHistory {
        let historyDomain: [GameHistorySingleRound] = history.map { $0.toDomain() }
        
        return GameHistory(uuid: uuid,
                           history: historyDomain,
                           level: level,
                           startTime: startTime,
                           endTime: endTime,
                           correctSelectionPosition: correctSelectionPosition,
                           correctSelectionSound: correctSelectionSound,
                           incorrectSelectionPosition: incorrectSelectionPosition,
                           incorrectSelectionSound: incorrectSelectionSound,
                           missedSelectionPosition: missedSelectionPosition,
                           missedSelectionSound: missedSelectionSound)
    }
}
