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
    let menuCoordinator: MenuCoordinator
    let gameCoordinator: GameCoordinator
    
    init() {
        appDIContainer = AppDIContainer()
        menuCoordinator = MenuCoordinator()
        gameCoordinator = GameCoordinator(menuCoordinator: menuCoordinator)
    }
    
    var body: some Scene {
        WindowGroup {
            MenuCoordinatorView(menuDIContainer: appDIContainer.makeMenuDIContainer(),
                                    menuCoordinator: menuCoordinator,
                                    gameCoordinator: gameCoordinator)
        }
    }
}
