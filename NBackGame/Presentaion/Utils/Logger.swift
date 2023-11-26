//
//  Logger.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 28/08/2023.
//

import FirebaseAnalytics

func log(_ params: [String: String]) {
    Analytics.logEvent("LogEvent", parameters: params)
}


