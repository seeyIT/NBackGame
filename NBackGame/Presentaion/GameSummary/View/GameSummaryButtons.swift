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
        if sizeCategory >  ContentSizeCategory.extraExtraLarge {
            VStack {
                PlayAgainButton(viewModel: viewModel)
                BackToMenuButton(viewModel: viewModel)
            }
            .padding()
        } else {
            HStack {
                Spacer()
                PlayAgainButton(viewModel: viewModel)
                Spacer()
                BackToMenuButton(viewModel: viewModel)
                Spacer()

            }
            .padding()
        }
    }
}

private struct PlayAgainButton: View {
    @ObservedObject var viewModel: GameSummaryViewModel

    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            withAnimation {
                viewModel.playAgain()
            }
        }, label: {
            MenuButton(iconName: "arrow.counterclockwise", text: "Play again")
            
        })
        .padding(.trailing)
        .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.playAgainButton)
    }
}

private struct BackToMenuButton: View {
    @ObservedObject var viewModel: GameSummaryViewModel

    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            withAnimation {
                viewModel.showMenu()
            }
        }, label: {
            MenuButton(iconName: "line.horizontal.3", text: "Menu")
        })
        .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.menuButton)
    }
}
