//
//  CurrentGameItem.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import Foundation

struct CurrentGameItem: Equatable {
    let position: Int
    let sound: String
    
    static func placeholder() -> CurrentGameItem {
        return CurrentGameItem(position: -1, sound: "")
    }
    
    static func == (lhs: CurrentGameItem, rhs: CurrentGameItem) -> Bool {
        return lhs.position == rhs.position && lhs.sound == rhs.sound
    }
}
