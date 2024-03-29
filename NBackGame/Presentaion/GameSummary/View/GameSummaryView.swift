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
            ScrollView(showsIndicators: false) {
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
                    GameSummaryButtons(viewModel: viewModel)
                }
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
