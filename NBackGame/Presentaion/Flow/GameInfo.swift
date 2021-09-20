//
//  Game.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import Foundation

struct GameInfo {
    var history: [HistoryItem]
    var level: Int
    var startTime: Int64 = 0
    var endTime: Int64 = 0
}
