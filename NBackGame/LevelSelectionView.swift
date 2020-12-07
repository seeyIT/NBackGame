//
//  LevelSelectionView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 23/11/2020.
//

import SwiftUI

struct LevelSelectionView: View {
    @State private var isShowingAlert = false
    
    var viewModel: LevelSelectionViewModel

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
                            if number < 5 {
                                Circle()
                                    .aspectRatio(1, contentMode: .fit)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                            } else {
                                Circle()
                                    .foregroundColor(.gray)
                                    .aspectRatio(1, contentMode: .fit)
                                
                            }
                            
                            
                            Text("\(number)")
                                .font(.title)
                                .bold()
                                .foregroundColor(Color.white)
                            
                        }
                        .onTapGesture {
                            print("tap: \(number)")
                            if number < 5 {
                                print("start game")
                            } else {
                                isShowingAlert = true
                            }
                        }
                        
                        
                    }
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("You haven't unlock this level yet"), message: Text("You need to finish the level before to start this"), dismissButton: .default(Text("OK")))
        }
    }
}

struct LevelSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectionView(viewModel: LevelSelectionViewModel())
    }
}
