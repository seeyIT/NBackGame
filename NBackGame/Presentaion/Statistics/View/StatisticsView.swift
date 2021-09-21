//
//  StatisticsView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 20/09/2021.
//

import SwiftUI
import Combine

struct StatisticsView: View {
    
    @ObservedObject var viewModel: StatisticsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            StatisticsTopPanelView(viewModel: viewModel)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.history, id: \.uuid) { gameHistory in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Correct: \(gameHistory.correctSelectionSound + gameHistory.correctSelectionPosition)")
                                    .foregroundColor(.green)
                                Text("Missed: \(gameHistory.missedSelectionSound + gameHistory.missedSelectionPosition)")
                                    .foregroundColor(.yellow)
                                Text("Incorrect: \(gameHistory.incorrectSelectionSound + gameHistory.incorrectSelectionPosition)")
                                    .foregroundColor(.red)
                            }
                            .font(.headline)
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text(Date(timeIntervalSince1970: TimeInterval(gameHistory.startTime / 1000)), style: .date)
                                    .foregroundColor(.white)
                                Text(Date(timeIntervalSince1970: TimeInterval(gameHistory.startTime / 1000)), style: .time)
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Level: \(gameHistory.level)")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                        .padding([.leading, .trailing, .bottom])
                        
                    }
                }
            }
            
        }
        .background(Color.black.ignoresSafeArea())
        
        .onAppear(perform: {
            viewModel.onAppear()
        })
    }
}
