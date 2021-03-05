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
            viewModel.$gameResultCalculated
                .sink { (calculated) in
                    withAnimation {
                          resultsCalculated = calculated
                    }
                }
                .store(in: &cancellable)
        })
    }
}

struct SummaryTable: View {
    @ObservedObject var viewModel: GameSummaryViewModel
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4)) {
            Group {
                Text("") /// Placeholer to move first row to the right
                Text("Correct selection")
                    .minimumScaleFactor(0.1)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                Text("Incorrect selection")
                    .minimumScaleFactor(0.1)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                Text("Missed")
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                
            }
            Group {
                Text("Position")
                
                Text("\(viewModel.correctSelectionPosition)")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.correctSelectionPositionText)

                
                Text("\(viewModel.incorrectSelectionPosition)")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.incorrectSelectionPositionText)

                
                Text("\(viewModel.missedSelectionPosition)")
                    .font(.title)
                    .foregroundColor(.yellow)
                    .padding()
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.missedSelectionPositionText)

            }
            Group {
                Text("Sound")
                
                Text("\(viewModel.correctSelectionSound)")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.correctSelectionSoundText)

                
                Text("\(viewModel.incorrectSelectionSound)")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.incorrectSelectionSoundText)
                
                Text("\(viewModel.missedSelectionSound)")
                    .font(.title)
                    .foregroundColor(.yellow)
                    .padding()
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.missedSelectionSoundText)

            }
        }
        .padding()
    }
}

//struct GameSummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameSummaryView(viewModel: GameSummaryViewModel(history: [], nBack: 0))
//    }
//}
