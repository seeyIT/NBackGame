//
//  GameTopPanel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 26/05/2021.
//

import SwiftUI

struct GameTopPanel: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.sizeCategory) var sizeCategory
    
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        if verticalSizeClass == .compact {
            HStack {
                GameBackButton(viewModel: viewModel)
                Spacer()
                Text("N: \(viewModel.gameCoordinator.gameInfo.level)")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Spacer()
                Text("Round: \(viewModel.currentRoundNumber)/\(viewModel.maxRounds)")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
            }
            .padding()
        } else {
            if sizeCategory > ContentSizeCategory.extraExtraLarge {
                VStack {
                    Text("N: \(viewModel.gameCoordinator.gameInfo.level)")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    Text("Round: \(viewModel.currentRoundNumber)/\(viewModel.maxRounds)")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
            } else {
                HStack {
                    Text("N: \(viewModel.gameCoordinator.gameInfo.level)")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding(.leading)
                    Spacer()
                    Text("Round: \(viewModel.currentRoundNumber)/\(viewModel.maxRounds)")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding(.trailing)
                }
                .padding()
            }
        }
    }
}
