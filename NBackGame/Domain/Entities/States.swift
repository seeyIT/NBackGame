//
//  ViewState.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import Foundation

class ViewState<T>: ObservableObject {
    @Published var state: T
    
    init(_ state: T) {
        self.state = state
    }
}

class GameState<T>: ViewState<T> {
    var gameInfo: GameInfo = GameInfo(history: [], level: 0)
}

enum MenuViewState {
    case menu
    case tutorial
    case game
}

enum GameViewState {
    case levelSelection
    case game
    case summary
}
