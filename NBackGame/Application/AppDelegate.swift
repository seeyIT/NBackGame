//
//  AppDelegate.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 03/02/2021.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        RealmService().performMigration()
        _ = RealmService().instance
        performMigration()
        
        return true
    }
        
    private func performMigration() {
        let appMigration = AppMigrationService()
        appMigration.performMigration()
    }
}
