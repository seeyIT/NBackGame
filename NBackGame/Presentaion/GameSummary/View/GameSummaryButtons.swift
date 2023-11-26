//
//  GameSummaryButtons.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 26/05/2021.
//

import SwiftUI
import StoreKit

struct GameSummaryButtons: View {
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.requestReview) var requestReview
    @AppStorage("userWasAskedForReview") private var userWasAskedForReview = false
    
    @ObservedObject var viewModel: GameSummaryViewModel
    @State var userWasAsked = false
    
    var body: some View {
        Group {
            if sizeCategory > ContentSizeCategory.extraExtraLarge {
                VStack {
                    createRateAppButton()
                    createPlayAgainButton()
                    createBackToMenuButton()
                }
                .padding()
            } else {
                VStack {
                    createRateAppButton()
                    HStack {
                        Spacer()
                        createPlayAgainButton()
                        Spacer()
                        createBackToMenuButton()
                        Spacer()
                    }
                }
                .padding()
            }
        }
        .onDisappear(perform: {
            if userWasAsked {
                userWasAskedForReview = true
            }
        })
    }
    
    @ViewBuilder
    private func createRateAppButton() -> some View {
        if !userWasAskedForReview {
            MenuButton(
                text: "Help me to share this app with other people! ❤️",
                accessibilityIdentifier: AccessibilityIdentifier.GameSummary.playAgainButton,
                onTapFeedbackImpact: .medium,
                onTap: {
                    self.userWasAsked = true
                    requestReview()
                }
            )
        } else {
            EmptyView()
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
