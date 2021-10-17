//
//  QuotesView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 04/10/2021.
//

import SwiftUI

struct QuotesView: View {
    @ObservedObject var viewModel: MenuViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.currentQuote.0)
                .font(.headline)
                .italic()
                + Text(" - ")
                + Text(viewModel.currentQuote.1)
                .bold()
        }
        .padding(20)
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
    }
}
