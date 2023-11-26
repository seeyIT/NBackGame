//
//  SplashScreenViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 26/11/2023.
//

import Foundation

class SplashScreenViewModel: ObservableObject {
    
    private let menuCoordinator: MenuCoordinator
 
    init(menuCoordinator: MenuCoordinator) {
        self.menuCoordinator = menuCoordinator
    }
    
    func showMenu() {
        log("Splash Screen view showMenu")
        menuCoordinator.showMenu()
    }
}
