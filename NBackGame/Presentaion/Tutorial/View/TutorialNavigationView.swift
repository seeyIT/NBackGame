//
//  TutorialNavigationView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 07/12/2020.
//

import SwiftUI

struct TutorialNavigationView: View {
    @Environment(\.sizeCategory) var sizeCategory
    
    @ObservedObject var viewModel: TutorialViewModel
    
    @Binding var scrollToIndex: Int?

    var body: some View {
        if sizeCategory > ContentSizeCategory.extraExtraLarge {
            VStack {
                if viewModel.currentStep != viewModel.firstStep {
                    TutorialNavigationBackButton(viewModel: viewModel, scrollToIndex: $scrollToIndex)
                }
                if viewModel.currentStep != viewModel.lastStep {
                    TutorialNavigationNextButton(viewModel: viewModel, scrollToIndex: $scrollToIndex)
                }
            }
        } else {
            HStack {
                if viewModel.currentStep != viewModel.firstStep {
                    Spacer()
                    TutorialNavigationBackButton(viewModel: viewModel, scrollToIndex: $scrollToIndex)
                    Spacer()
                }
                if viewModel.currentStep != viewModel.lastStep {
                    Spacer()
                    TutorialNavigationNextButton(viewModel: viewModel, scrollToIndex: $scrollToIndex)
                    Spacer()
                }
            }
        }
        
    }
}

private struct TutorialNavigationNextButton: View {
    @ObservedObject var viewModel: TutorialViewModel
    
    @Binding var scrollToIndex: Int?

    var body: some View {
        Button(action: {
            withAnimation {
                viewModel.nextStep()
                scrollToIndex = viewModel.currentStep
            }
        }, label: {
            MenuButton(iconName: "arrow.right", text: "Next", imageOnLeft: false)
        })
        .accessibilityIdentifier(AccessibilityIdentifier.Tutorial.previousButton)
    }
}

private struct TutorialNavigationBackButton: View {
    @ObservedObject var viewModel: TutorialViewModel
    
    @Binding var scrollToIndex: Int?

    var body: some View {
        Button(action: {
            withAnimation {
                viewModel.previousStep()
                scrollToIndex = viewModel.currentStep
            }
        }, label: {
            MenuButton(iconName: "arrow.left", text: "Back")
        })
        .accessibilityIdentifier(AccessibilityIdentifier.Tutorial.nextButton)
    }
}
