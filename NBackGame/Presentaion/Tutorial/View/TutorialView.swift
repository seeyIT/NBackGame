//
//  TutorialView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 19/11/2020.
//

import SwiftUI

struct TutorialView: View {
    @ObservedObject var viewModel: TutorialViewModel
    
    @State private var scrollToIndex: Int?
    
    private let TUTORIAL_CONTENT_ID = 0
    
    var steps: [Int: AnyView] = [
        1: AnyView(TutorialStep1()),
        2: AnyView(TutorialStep2()),
        3: AnyView(TutorialStep3()),
        4: AnyView(TutorialStep4()),
        5: AnyView(TutorialStep5()),
        6: AnyView(TutorialStep6()),
        7: AnyView(TutorialStep7()),
        8: AnyView(TutorialStep8()),
        9: AnyView(TutorialStep9()),
        10: AnyView(TutorialStep10()),
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ScrollViewReader { viewReader in
                ZStack {
                    Color.black.ignoresSafeArea()
                    VStack {
                        Spacer()
                        steps[viewModel.currentStep]
                            .id(TUTORIAL_CONTENT_ID)
                        Spacer()
                        TutorialNavigationView(viewModel: viewModel, scrollToIndex: $scrollToIndex)
                    }
                }
                .onChange(of: scrollToIndex) { _ in
                    withAnimation {
                        viewReader.scrollTo(TUTORIAL_CONTENT_ID, anchor: .top)
                    }
                }
                .onAppear {
                    viewModel.currentStep = viewModel.firstStep
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(viewModel: TutorialViewModel())
    }
}
