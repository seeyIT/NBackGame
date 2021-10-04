//
//  TutorialView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 19/11/2020.
//

import SwiftUI

struct TutorialView: View {
    @ObservedObject var viewModel: TutorialViewModel
    
    private let tutorialContentId = 0
    
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
        10: AnyView(TutorialStep10())
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                TutorialTopPanelView(viewModel: viewModel)
                ScrollViewReader { viewReader in
                    ScrollView(showsIndicators: false) {
                        VStack {
                            Spacer()
                            Text("")
                                .id(tutorialContentId)
                            steps[viewModel.currentStep]
                            Spacer()
                            TutorialNavigationView(viewModel: viewModel)
                        }
                        
                        .onChange(of: viewModel.currentStep) { _ in
                            withAnimation {
                                viewReader.scrollTo(tutorialContentId)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}
