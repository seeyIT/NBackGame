//
//  Utils.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 03/02/2021.
//

import Foundation

func getTimestamp() -> Int64 {
    return Int64(Date().timeIntervalSince1970 * 1000)
}
