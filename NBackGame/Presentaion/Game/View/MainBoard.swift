//
//  MainBoard.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import SwiftUI

struct MainBoard: View {
    var boardSize: Int
    var cellsCount: Int
    var currentItemPosition: Int
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(maximum: getMaximumFieldSize())), count: boardSize)) {
            ForEach(0..<cellsCount, id: \.self) { number in
                ZStack {
                    Rectangle()
                        .foregroundColor(currentItemPosition == number ? .blue : .white)
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(8)
                }
                .onTapGesture {
                    print("tap: \(number)")
                }
            }
        }
        .padding()
    }
    
    func getMaximumFieldSize() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let smallerSize = screenWidth > screenHeight ? screenHeight : screenWidth
        return smallerSize * 0.2
    }
}
