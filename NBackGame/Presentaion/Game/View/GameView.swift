//
//  GameView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 04/10/2020.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Text("N: \(viewModel.level)")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()
                    Spacer()
                    Text("Round: \(viewModel.currentRoundNumber)/\(viewModel.maxRounds)")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()
                    
                }
                
                MainBoard(boardSize: viewModel.boardSize, cellsCount: viewModel.cellsCount, currentItemPosition: viewModel.currentItem.position)
                Spacer()
                
                GameBottomPanel(viewModel: viewModel)
                
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
