//
//  GameSummaryView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/11/2020.
//

import SwiftUI
import Combine

struct GameSummaryView: View {
    @ObservedObject var viewModel: GameSummaryViewModel
    @State private var resultsCalculated = false
    @State private var cancellable = Set<AnyCancellable>()
    
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("Results")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding()
                if resultsCalculated {
                    SummaryTable(viewModel: viewModel)
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            viewModel.playAgain()
                            
                        }
                    }, label: {
                        MenuButton(iconName: "arrow.counterclockwise", text: "Play again")
                            .frame(width: 120, height: 120)                           
                    })
                    .padding(.trailing)
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.playAgainButton)
                    
                    Spacer()
                    Button(action: {
                        withAnimation {
                            viewModel.showMenu()
                        }
                    }, label: {
                        MenuButton(iconName: "line.horizontal.3", text: "Menu")
                            .frame(width: 120, height: 120)
                    })
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.menuButton)
                    Spacer()
                }
                .padding()
            }
        }
        .foregroundColor(.white)
        .navigationBarHidden(true)
        .onAppear(perform: {
            viewModel.onAppear()
            viewModel.$gameResults
                .sink { gameResults in
                    print("calculated in view: \(gameResults)")
                    withAnimation {
                        resultsCalculated = gameResults.gameResultCalculated
                    }
                }
                .store(in: &cancellable)
        })
    }
}

//struct GameSummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameSummaryView(viewModel: GameSummaryViewModel(history: [], nBack: 0))
//    }
//}
