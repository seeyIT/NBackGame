//
//  MenuViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var menuViewState: ViewState<MenuViewState>
    
    init(menuViewState: ViewState<MenuViewState>) {
        self.menuViewState = menuViewState
    }
    
    func startGame() {
        menuViewState.state = .game
    }
}
