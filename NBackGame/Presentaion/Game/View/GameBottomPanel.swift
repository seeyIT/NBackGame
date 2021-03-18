//
//  GameBottomPanel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import SwiftUI

struct GameBottomPanel: View {
    
    @ObservedObject private var viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                print("position clicked")
                viewModel.selectPosition()
            }, label: {
                GameButton(pressed: $viewModel.positionClicked, text: "Position")
            })
            .disabled($viewModel.positionClicked.wrappedValue)
            .accessibilityIdentifier(AccessibilityIdentifier.Game.positionButton)
            
            Spacer()
            
            Button(action: {
                print("sound clicked")
                viewModel.selectSound()
            }, label: {
                GameButton(pressed: $viewModel.soundClicked, text: "Sound")
            })
            .disabled($viewModel.soundClicked.wrappedValue)
            .accessibilityIdentifier(AccessibilityIdentifier.Game.soundButton)
            Spacer()
        }
    }
}
