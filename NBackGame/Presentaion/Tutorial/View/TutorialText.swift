//
//  TutorialText.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 07/12/2020.
//

import SwiftUI

struct TutorialText: View {
    init(_ text: String) {
        self.text = text
    }
    
    private let text: String
    
    var body: some View {
        Text(LocalizedStringKey(text.description))
            .font(.body)
            .foregroundColor(.white)
            .padding()
    }
}
