//
//  LevelSelectionView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 23/11/2020.
//

import SwiftUI

struct LevelSelectionView: View {
    @State private var isShowingAlert = false
    @ObservedObject var viewModel: LevelSelectionViewModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("Choose N")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
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
                                        .aspectRatio(1, contentMode: .fit)
                                        .foregroundColor(Color.blue.opacity(0.4))
                                        .overlay(
                                            Circle()
                                                .stroke(Color.blue, lineWidth: 2)
                                        )
                                } else {
                                    Circle()
                                        .foregroundColor(.gray)
                                        .aspectRatio(1, contentMode: .fit)
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
        .navigationBarHidden(true)
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("You haven't unlock this level yet"), message: Text("You need to finish the level \(viewModel.selectedLevel - 1) to start this"), dismissButton: .default(Text("OK")))
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
    }
}
//
//struct LevelSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        LevelSelectionView()
//    }
//}
