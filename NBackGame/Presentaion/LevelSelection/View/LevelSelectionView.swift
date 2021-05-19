//
//  LevelSelectionView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 23/11/2020.
//

import SwiftUI

struct LevelSelectionView: View {
    @State private var isShowingAlert = false
    @State private var gridCount = 3
    @ObservedObject var viewModel: LevelSelectionViewModel
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.black.ignoresSafeArea()
                LevelSelectionBackButton(viewModel: viewModel)
                VStack {
                    Text("Choose N")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: gridCount)) {
                        ForEach(1...12, id: \.self) { number in
                            ZStack {
                                Button(action: {
                                    viewModel.selectLevel(number)
                                    if number > viewModel.unlockedLevels {
                                        isShowingAlert = true
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
//
//struct LevelSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        LevelSelectionView()
//    }
//}
