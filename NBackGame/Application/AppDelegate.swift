//
//  AppDelegate.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 03/02/2021.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    private let appMigration = AppMigrationService()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
            
        _ = RealmService().instance

        appMigration.performMigration()
        
        return true
    }
}
