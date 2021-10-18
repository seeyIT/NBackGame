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
    let menuCoordinator: MenuViewCoordinator
    let gameCoordinator: GameViewCoordinator
    
    init() {
        appDIContainer = AppDIContainer()
        menuCoordinator = MenuViewCoordinator()
        gameCoordinator = GameViewCoordinator(menuCoordinator: menuCoordinator)
    }
    
    var body: some Scene {
        WindowGroup {
            MenuViewCoordinatorView(menuDIContainer: appDIContainer.makeMenuDIContainer(),
                                    menuCoordinator: menuCoordinator,
                                    gameCoordinator: gameCoordinator)
        }
    }
}
