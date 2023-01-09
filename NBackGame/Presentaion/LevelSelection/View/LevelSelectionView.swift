//
//  LevelSelectionView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 23/11/2020.
//

import SwiftUI

struct LevelSelectionView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @ObservedObject var viewModel: LevelSelectionViewModel
    
    @State private var isShowingAlert = false
    @State private var gridCount = 3
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView {
                VStack {
                    LevelSelectionBackButton(viewModel: viewModel)
                    VStack {
                        Text("Choose N")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .padding()
                        Text("Before playing, make sure you have Silent Mode off in your iPhone to be able to hear game sounds.")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: gridCount)) {
                        ForEach(1...12, id: \.self) { number in
                            ZStack {
                                Button(action: {
                                    withAnimation {
                                        viewModel.selectLevel(number)
                                    }
                                    if number > viewModel.unlockedLevels {
                                        isShowingAlert = true
                                        UINotificationFeedbackGenerator().notificationOccurred(.error)
                                    } else {
                                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                    }
                                }, label: {
                                    if number <= viewModel.unlockedLevels {
                                        Circle()
                                            .foregroundColor(Color.blue.opacity(0.4))
                                            .aspectRatio(contentMode: .fill)
                                            .overlay(
                                                Circle()
                                                    .stroke(Color.blue, lineWidth: 2)
                                            )
                                    } else {
                                        Circle()
                                            .foregroundColor(.gray)
                                            .aspectRatio(contentMode: .fill)
                                    }
                                    
                                })
                                .accessibility(identifier: "\(AccessibilityIdentifier.LevelSelection.levelPrefixButton)\(number)")
                                Text("\(number)")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Color.white)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("You haven't unlock this level yet"), message: Text("You need to finish the level \(viewModel.selectedLevel - 1) to start this"), dismissButton: .default(Text("OK")))
        }
        .onAppear(perform: {
            calculateGridCount()
            viewModel.onAppear()
        })
    }
    
    private func calculateGridCount() {
        if verticalSizeClass == .compact ||
            (horizontalSizeClass == .regular && verticalSizeClass == .regular) {
            gridCount = 4
        } else {
            gridCount = 3
        }
    }
}
