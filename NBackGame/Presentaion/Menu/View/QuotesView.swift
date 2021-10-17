//
//  QuotesView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 04/10/2021.
//

import SwiftUI
import Combine

struct QuotesView: View {
    @ObservedObject var viewModel: MenuViewModel
    
    @State private var quote: (String, String) = ("", "")
    @State private var cancellable = Set<AnyCancellable>()
    
    var body: some View {
        HStack {
            Text(quote.0)
                .font(.headline)
                .italic()
                + Text(" - ")
                + Text(quote.1)
                .bold()
        }
        .padding(20)
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
        .onAppear(perform: {
            viewModel
                .$currentQuote
                .assign(to: \.quote, on: self)
                .store(in: &cancellable)
        })
    }
}
