//
//  StatisticsViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 20/09/2021.
//

import SwiftUI

class StatisticsViewModel: ObservableObject {
    var menuCoordinator: MenuViewCoordinator
    
    init(menuCoordinator: MenuViewCoordinator) {
        self.menuCoordinator = menuCoordinator
    }
}
