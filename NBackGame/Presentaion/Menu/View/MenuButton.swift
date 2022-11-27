//
//  MenuButton.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/10/2021.
//

import SwiftUI

struct MenuButton: View {
    @ScaledMetric var imageSize: CGFloat = 16
    
    var iconName: String
    var text: String
    var imageOnLeft: Bool = true
    var fixedWidth: CGFloat?
    
    var body: some View {
        HStack {
            if imageOnLeft {
                Image(systemName: iconName)
                    .frame(width: imageSize, height: imageSize)
                Text(text)
                    .font(.headline)
                    .frame(alignment: .center)
            } else {
                Text(text)
                    .font(.headline)
                    .frame(alignment: .center)
                Image(systemName: iconName)
                    .frame(width: imageSize, height: imageSize)
            }
        }
        .padding()
        .foregroundColor(Color.blue)
        .ifLet(fixedWidth) { $0.frame(width: $1) }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.blue, lineWidth: 2)
                .foregroundColor(Color.yellow)
        )
    }
}
