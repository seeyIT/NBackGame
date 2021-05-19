//
//  AppMigrationService.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 03/02/2021.
//

import Foundation

class AppMigrationService {
    
    private let realmService: RealmService = RealmService()
    
    func performMigration() {
        let newestAppVersion: AppVersion? = realmService.instance.objects(AppVersionRealm.self).sorted(byKeyPath: "version").last?.toDomain()
        let shortVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let lastAppVersion = newestAppVersion?.version ?? 0
        let currentAppVersion: Int = Int(shortVersion.components(separatedBy: ".").first ?? "0") ?? 0
        
        print("lastAppVersion: \(lastAppVersion)")
        print("currentAppVersion: \(currentAppVersion)")
        if currentAppVersion > lastAppVersion {
            migrate(from: lastAppVersion)
            
            let newAppVersion = AppVersionRealm(version: currentAppVersion)
            do {
                try realmService.instance.write {
                    realmService.instance.add(newAppVersion)
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    private func migrate(from version: Int) {
        print("migrate from: v\(version)")
        if version < 2 {
            let defaultUnlockedLevel = UnlockedLevelRealm(level: 2)
            do {
                try realmService.instance.write {
                    realmService.instance.add(defaultUnlockedLevel)
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
