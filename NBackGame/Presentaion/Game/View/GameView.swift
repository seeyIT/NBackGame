//
//  GameView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 04/10/2020.
//

import SwiftUI

struct GameView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            if verticalSizeClass == .compact  {
                VStack {
                    Spacer()
                    HStack {
                        GameBackButton(viewModel: viewModel)
                        Spacer()
                        Text("N: \(viewModel.level)")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        Spacer()
                        Text("Round: \(viewModel.currentRoundNumber)/\(viewModel.maxRounds)")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        
                    }
                    .padding()
                    
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
                        GameBackButton(viewModel: viewModel)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("N: \(viewModel.level)")
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

//
//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView(viewModel: GameViewModel())
//    }
//}
