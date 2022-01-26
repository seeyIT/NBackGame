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
    
    let appDIContainer: AppDIContainer
    let menuCoordinator: DefaultMenuCoordinator
    let gameCoordinator: DefaultGameCoordinator
    
    init() {
        appDIContainer = AppDIContainer()
        menuCoordinator = DefaultMenuCoordinator()
        gameCoordinator = DefaultGameCoordinator(menuCoordinator: menuCoordinator)
    }
    
    var body: some Scene {
        WindowGroup {
            MenuCoordinatorView(menuDIContainer: appDIContainer.makeMenuDIContainer(),
                                    menuCoordinator: menuCoordinator,
                                    gameCoordinator: gameCoordinator)
        }
    }
}
