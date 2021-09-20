//
//  GameHistory.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 20/09/2021.
//

import Foundation

struct GameHistory {
    let uuid: String
    let history: [GameHistorySingleRound]
    let level: Int
    let startTime: Int64
    let endTime: Int64
}
