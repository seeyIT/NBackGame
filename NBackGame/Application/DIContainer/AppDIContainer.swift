//
//  AppDIContainer.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 05/10/2021.
//

import Foundation

class AppDIContainer {
    
    lazy var musicService: MusicService = {
        return MusicService()
    }()
    
    func makeMenuDIContainer() -> MenuDIContainer {
        let dependencies = MenuDIContainer.Dependencies(musicService: musicService)
        return MenuDIContainer(dependencies: dependencies)
    }
}
