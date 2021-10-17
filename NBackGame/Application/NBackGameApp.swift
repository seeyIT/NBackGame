//
//  NBackGameApp.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 04/10/2020.
//

import SwiftUI

@main
struct NBackGameApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let appDIContainer = AppDIContainer()
    let menuCooridator = MenuViewCoordinator()
    
    var body: some Scene {
        WindowGroup {
            MenuViewCoordinatorView(menuDIContainer: appDIContainer.makeMenuDIContainer(), menuCoordinator: menuCooridator)
        }
    }
}
