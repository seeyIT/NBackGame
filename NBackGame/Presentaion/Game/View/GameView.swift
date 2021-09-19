//
//  GameView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 04/10/2020.
//

import SwiftUI

struct GameView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.sizeCategory) var sizeCategory
    
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            if verticalSizeClass == .compact {
                VStack {
                    Spacer()
//                    GameTopPanel(gameCoordinator: gameCoordinator)
                    Spacer()
                    HStack {
                        GamePositionButton(viewModel: viewModel)
                        MainBoard(boardSize: viewModel.boardSize, cellsCount: viewModel.cellsCount, currentItemPosition: viewModel.currentItem.position)
                        GameSoundButton(viewModel: viewModel)
                    }
                    Spacer()
                }
            } else {
                VStack {
                    HStack {
//                        GameBackButton(gameCoordinator: gameCoordinator)
                        Spacer()
                    }
                    GameTopPanel(viewModel: viewModel)
                    Spacer()
                    MainBoard(boardSize: viewModel.boardSize, cellsCount: viewModel.cellsCount, currentItemPosition: viewModel.currentItem.position)
                    Spacer()
                    GameBottomPanel(viewModel: viewModel)
                }
                
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.startGame()
        }
    }
}
