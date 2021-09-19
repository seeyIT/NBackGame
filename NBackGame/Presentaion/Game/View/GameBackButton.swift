//
//  BackButton.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 12/05/2021.
//

import SwiftUI

struct GameBackButton: View {
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        Button(action: {
            viewModel.showMenu()
        }, label: {
            Image(systemName: "arrow.backward")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
        })
        .accessibilityIdentifier(AccessibilityIdentifier.Game.showMenuButton)
    }
}
