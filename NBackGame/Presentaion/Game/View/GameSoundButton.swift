//
//  GameSoundButton.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 19/05/2021.
//

import SwiftUI

struct GameSoundButton: View {
    @ObservedObject private var viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Button(action: {
            print("sound clicked")
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            viewModel.selectSound()
        }, label: {
            GameButton(pressed: $viewModel.soundClicked, text: "Sound")
        })
        .disabled($viewModel.soundClicked.wrappedValue)
        .accessibilityIdentifier(AccessibilityIdentifier.Game.soundButton)
    }
}
