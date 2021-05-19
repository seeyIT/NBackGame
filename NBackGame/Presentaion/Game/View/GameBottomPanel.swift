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
            GamePositionButton(viewModel: viewModel)
            Spacer()
            GameSoundButton(viewModel: viewModel)
            Spacer()
        }
    }
}
