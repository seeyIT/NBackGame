//
//  LevelSelectionBackButton.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 19/05/2021.
//

import SwiftUI

struct LevelSelectionBackButton: View {
    let viewModel: LevelSelectionViewModel

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    viewModel.showMenu()
                }, label: {
                    VStack {
                        Image(systemName: "arrow.backward")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .padding()
                    }
                })
                Spacer()
            }
            Spacer()
        }
        .accessibility(identifier: AccessibilityIdentifier.LevelSelection.showMenuButton)
        
    }
}
