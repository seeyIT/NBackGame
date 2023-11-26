//
//  MenuButton.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/10/2021.
//

import SwiftUI

struct MenuButton: View {
    @ScaledMetric private var imageSize: CGFloat = 16
    
    let leftIconName: String?
    let rightIconName: String?
    let text: String
    let imageOnLeft: Bool
    let fixedWidth: CGFloat?
    let accessibilityIdentifier: String
    let onTapFeedbackImpact: UIImpactFeedbackGenerator.FeedbackStyle?
    let onTap: () -> Void
    
    init(
        leftIconName: String? = nil,
        rightIconName: String? = nil,
        text: String,
        imageOnLeft: Bool = true,
        fixedWidth: CGFloat? = nil,
        accessibilityIdentifier: String,
        onTapFeedbackImpact: UIImpactFeedbackGenerator.FeedbackStyle? = nil,
        onTap: @escaping () -> Void = { }
    ) {
        self.leftIconName = leftIconName
        self.rightIconName = rightIconName
        self.text = text
        self.imageOnLeft = imageOnLeft
        self.fixedWidth = fixedWidth
        self.accessibilityIdentifier = accessibilityIdentifier
        self.onTapFeedbackImpact = onTapFeedbackImpact
        self.onTap = onTap
    }
    
    var body: some View {
        Button(action: {
            if let onTapFeedbackImpact = onTapFeedbackImpact {
                UIImpactFeedbackGenerator(style: onTapFeedbackImpact).impactOccurred()
            }
            onTap()
        }, label: {
            HStack {
                if let leftIconName = leftIconName {
                    Image(systemName: leftIconName)
                        .frame(width: imageSize, height: imageSize)
                    Text(LocalizedStringKey(text.description))
                        .font(.headline)
                        .frame(alignment: .center)
                }
                if let rightIconName = rightIconName {
                    Text(LocalizedStringKey(text.description))
                        .font(.headline)
                        .frame(alignment: .center)
                    Image(systemName: rightIconName)
                        .frame(width: imageSize, height: imageSize)
                }
            }
            .padding()
            .foregroundColor(Color.blue)
            .ifLet(fixedWidth) { $0.frame(width: $1) }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.blue, lineWidth: 2)
            )
        })
        .padding(.bottom, 16)
        .accessibilityIdentifier(accessibilityIdentifier)        
    }
}
