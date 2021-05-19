//
//  GamePositionButton.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 19/05/2021.
//

import SwiftUI

struct GamePositionButton: View {
    @ObservedObject private var viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Button(action: {
            print("position clicked")
            viewModel.selectPosition()
        }, label: {
            GameButton(pressed: $viewModel.positionClicked, text: "Position")
        })
        .disabled($viewModel.positionClicked.wrappedValue)
        .accessibilityIdentifier(AccessibilityIdentifier.Game.positionButton)
    }
}
