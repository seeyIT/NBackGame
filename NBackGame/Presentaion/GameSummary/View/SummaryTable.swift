//
//  SummaryTable.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import SwiftUI

struct SummaryTable: View {
    @ObservedObject var viewModel: GameSummaryViewModel
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4)) {
            Group {
                Text("") // Placeholer to move first row to the right
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
                
                Text("\(viewModel.gameResults.correctSelectionPosition.description)")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.correctSelectionPositionText)
                
                Text("\(viewModel.gameResults.incorrectSelectionPosition.description)")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.incorrectSelectionPositionText)
                
                Text("\(viewModel.gameResults.missedSelectionPosition.description)")
                    .font(.title)
                    .foregroundColor(.yellow)
                    .padding()
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.missedSelectionPositionText)
                
            }
            Group {
                Text("Sound")
                
                Text("\(viewModel.gameResults.correctSelectionSound.description)")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.correctSelectionSoundText)
                
                Text("\(viewModel.gameResults.incorrectSelectionSound.description)")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.incorrectSelectionSoundText)
                
                Text("\(viewModel.gameResults.missedSelectionSound.description)")
                    .font(.title)
                    .foregroundColor(.yellow)
                    .padding()
                    .accessibilityIdentifier(AccessibilityIdentifier.GameSummary.missedSelectionSoundText)
                
            }
        }
        .padding()
    }
}
