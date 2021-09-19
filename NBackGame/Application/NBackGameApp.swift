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

    let menuDIContainer = MenuDIContainer()
    @StateObject var menuViewState: ViewState<MenuViewState>  = ViewState<MenuViewState>(MenuViewState.menu)
    
    var body: some Scene {
        WindowGroup {
            MenuViewCoordinator(menuDIContainer: menuDIContainer, menuViewState: menuViewState)
        }
    }
}
