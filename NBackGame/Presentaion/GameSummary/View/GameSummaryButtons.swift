//
//  GameSummaryButtons.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 26/05/2021.
//

import SwiftUI

struct GameSummaryButtons: View {
    @ObservedObject var viewModel: GameSummaryViewModel
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        if sizeCategory > ContentSizeCategory.extraExtraLarge {
            VStack {
                createPlayAgainButton()
                createBackToMenuButton()
            }
            .padding()
        } else {
            HStack {
                Spacer()
                createPlayAgainButton()
                Spacer()
                createBackToMenuButton()
                Spacer()
            }
            .padding()
        }
    }
    
    @ViewBuilder
    private func createPlayAgainButton() -> some View {
        MenuButton(
            leftIconName: "arrow.counterclockwise",
            text: "Play again",
            accessibilityIdentifier: AccessibilityIdentifier.GameSummary.playAgainButton,
            onTapFeedbackImpact: .medium,
            onTap: {
                withAnimation {
                    viewModel.playAgain()
                }
            }
        )
        .padding(.trailing)
    }
    
    @ViewBuilder
    private func createBackToMenuButton() -> some View {
        MenuButton(
            leftIconName: "line.horizontal.3",
            text: "Menu",
            accessibilityIdentifier: AccessibilityIdentifier.GameSummary.menuButton,
            onTapFeedbackImpact: .medium,
            onTap: {
                withAnimation {
                    viewModel.showMenu()
                }
            }
        )
    }
}
