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
    
    var body: some View {
        if sizeCategory > ContentSizeCategory.extraExtraLarge {
            VStack {
                if viewModel.currentStep != viewModel.firstStep {
                    createBackButton()
                }
                if viewModel.currentStep != viewModel.lastStep {
                    createNextButton()
                }
            }
        } else {
            HStack {
                if viewModel.currentStep != viewModel.firstStep {
                    Spacer()
                    createBackButton()
                    Spacer()
                }
                if viewModel.currentStep != viewModel.lastStep {
                    Spacer()
                    createNextButton()
                    Spacer()
                }
            }
        }
        if viewModel.currentStep == viewModel.lastStep {
            createBackToMenuButton()
        }
    }
    
    @ViewBuilder
    private func createNextButton() -> some View {
        MenuButton(
            rightIconName: "arrow.right",
            text: "Next",
            accessibilityIdentifier: AccessibilityIdentifier.Tutorial.nextButton,
            onTapFeedbackImpact: .light,
            onTap: {
                withAnimation {
                    viewModel.nextStep()
                }
            }
        )
    }
    
    @ViewBuilder
    private func createBackButton() -> some View {
        MenuButton(
            leftIconName: "arrow.left",
            text: "Back",
            accessibilityIdentifier: AccessibilityIdentifier.Tutorial.previousButton,
            onTapFeedbackImpact: .light,
            onTap: {
                withAnimation {
                    viewModel.previousStep()
                }
            }
        )
    }
    
    @ViewBuilder
    private func createBackToMenuButton() -> some View {
        MenuButton(
            leftIconName: "line.horizontal.3",
            text: "Back to Menu",
            accessibilityIdentifier: AccessibilityIdentifier.Tutorial.menuButton,
            onTapFeedbackImpact: .medium,
            onTap: {
                withAnimation {
                    viewModel.showMenu()
                }
            }
        )
        .padding()
    }
}
