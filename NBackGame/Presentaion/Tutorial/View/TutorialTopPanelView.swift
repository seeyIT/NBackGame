//
//  TutorialTopPanelView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 04/10/2021.
//

import SwiftUI

struct TutorialTopPanelView: View {
    @ObservedObject var viewModel: TutorialViewModel
    
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
                .accessibilityIdentifier(AccessibilityIdentifier.Tutorial.showMenuButton)
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("Tutorial")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Spacer()
            }
        }
    }
}
