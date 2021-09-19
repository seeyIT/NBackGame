//
//  GameSummaryButtons.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 26/05/2021.
//

import SwiftUI

struct GameSummaryButtons: View {
    let gameCoordinator: GameViewCoordinator
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        if sizeCategory >  ContentSizeCategory.extraExtraLarge {
            VStack {
                PlayAgainButton(gameCoordinator: gameCoordinator)
                BackToMenuButton(gameCoordinator: gameCoordinator)
            }
            .padding()
        } else {
            HStack {
                Spacer()
                PlayAgainButton(gameCoordinator: gameCoordinator)
                Spacer()
                BackToMenuButton(gameCoordinator: gameCoordinator)
                Spacer()

            }
            .padding()
        }
    }
}

private struct PlayAgainButton: View {
    let gameCoordinator: GameViewCoordinator

    var body: some View {
        Button(action: {
            withAnimation {
                gameCoordinator.playAgain()
            }
        }, label: {
            MenuButton(iconName: "arrow.counterclockwise", text: "Play again")
            
        })
        .padding(.trailing)
        .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.playAgainButton)
    }
}

private struct BackToMenuButton: View {
    let gameCoordinator: GameViewCoordinator

    var body: some View {
        Button(action: {
            withAnimation {
                gameCoordinator.showMenu()
            }
        }, label: {
            MenuButton(iconName: "line.horizontal.3", text: "Menu")
        })
        .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.menuButton)
    }
}
