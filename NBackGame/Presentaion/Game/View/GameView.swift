//
//  GameView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 04/10/2020.
//

import SwiftUI

struct GameButton: View {
    @Binding var pressed: Bool
    var text: String
    private let margin: CGFloat = 40
    var body: some View {
        ZStack {
            if pressed {
                PlayCircle()
                    .foregroundColor(Color.blue)
                Text(text)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.white)
                
            } else {
                PlayCircle()
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                Text(text)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.blue)
            }
        }
        .frame(width: 140, height: 140)
        
    }
}

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Text("N: \(viewModel.nBack)")
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

struct MainBoard: View {
//    @ObservedObject private var viewModel: GameViewModel
    
//    init(viewModel: GameViewModel) {
//        self.viewModel = viewModel
//    }
    
    var boardSize: Int
    var cellsCount: Int
    var currentItemPosition: Int
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: boardSize)) {
            ForEach(0..<cellsCount, id: \.self) { number in
                ZStack {
                    Rectangle()
                        .foregroundColor(currentItemPosition == number ? .blue : .white)
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(8)
                }
                .onTapGesture {
                    print("tap: \(number)")
                }
            }
        }
        .padding()
    }
}

struct GameBottomPanel: View {
    
    @ObservedObject private var viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Spacer()
           
            GameButton(pressed: $viewModel.positionClicked, text: "Position")
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ value in
                            print("on changes")
                            viewModel.selectPosition()
                        })
                        .onEnded({ _ in
                            print("on endede")
                            
                            
                        })
                )
            Spacer()
            
            GameButton(pressed: $viewModel.soundClicked, text: "Sound")
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ value in
                            print("on changes")
                            viewModel.selectSound()
                            
                        })
                        .onEnded({ _ in
                            print("on endede")
                            
                            
                        })
                )
            
            Spacer()
        }
    }
}
//
//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView(viewModel: GameViewModel())
//    }
//}
