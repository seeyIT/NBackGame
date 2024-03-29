//
//  GameButton.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import SwiftUI

struct GameButton: View {
    @Binding var pressed: Bool
    var text: String
    private let margin: CGFloat = 40
    var body: some View {
        ZStack {
            if pressed {
                PlayCircle()
                    .foregroundColor(Color.blue)
                Text(LocalizedStringKey(text.description))
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.white)
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
            } else {
                PlayCircle()
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                Text(LocalizedStringKey(text.description))
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.blue)
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
            }
        }
        .frame(width: 140, height: 140)
    }
}
