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
    @State private var isShowingAlert = false

    var body: some View {
        VStack(spacing: 0) {
            StatisticsTopPanelView(viewModel: viewModel)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.history, id: \.uuid) { gameHistory in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Correct: \((gameHistory.correctSelectionSound + gameHistory.correctSelectionPosition).description)")
                                    .foregroundColor(.green)
                                Text("Missed: \((gameHistory.missedSelectionSound + gameHistory.missedSelectionPosition).description)")
                                    .foregroundColor(.yellow)
                                Text("Incorrect: \((gameHistory.incorrectSelectionSound + gameHistory.incorrectSelectionPosition).description)")
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
                                Text("Level: \(gameHistory.level.description)")
                                    .foregroundColor(.white)
                            }
                            VStack {
                                Button {
                                    viewModel.selectedGameHistory = gameHistory
                                    isShowingAlert.toggle()
                                } label: {
                                    Image(systemName: "multiply")
                                        .foregroundColor(.red)
                                }
                               Spacer()
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
        .alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text(""),
                message: Text("Are you sure you want to remove this game history record?"),
                primaryButton: .destructive(Text("Yes, delete"), action: { viewModel.deleteSelectedGameHistory() }),
                secondaryButton: .default(Text("No, cancel"))
            )
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
    }
}
