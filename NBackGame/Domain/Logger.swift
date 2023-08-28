//
//  Logger.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 28/08/2023.
//

import FirebaseAnalytics
import Foundation

func log(_ message: String, parameters: [String: Any]? = nil) {
    Analytics.logEvent(message, parameters: parameters)
}
