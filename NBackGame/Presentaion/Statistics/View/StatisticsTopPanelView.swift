//
//  StatisticsTopPanelView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 21/09/2021.
//

import SwiftUI

struct StatisticsTopPanelView: View {
    @ObservedObject var viewModel: StatisticsViewModel

    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    withAnimation {
                        viewModel.showMenu()
                    }
                }, label: {
                    Image(systemName: "arrow.backward")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()
                })
                .accessibilityIdentifier(AccessibilityIdentifier.Statistics.menuButton)
                Spacer()
            }
           
            HStack {
                Spacer()
                Text("Statistics")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Spacer()
            }
            
        }
    }
}
