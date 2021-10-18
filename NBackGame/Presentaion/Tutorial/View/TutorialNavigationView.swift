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
                    TutorialNavigationBackButton(viewModel: viewModel)
                }
                if viewModel.currentStep != viewModel.lastStep {
                    TutorialNavigationNextButton(viewModel: viewModel)
                }
            }
        } else {
            HStack {
                if viewModel.currentStep != viewModel.firstStep {
                    Spacer()
                    TutorialNavigationBackButton(viewModel: viewModel)
                    Spacer()
                }
                if viewModel.currentStep != viewModel.lastStep {
                    Spacer()
                    TutorialNavigationNextButton(viewModel: viewModel)
                    Spacer()
                }
            }
        }
        if viewModel.currentStep == viewModel.lastStep {
            Button(action: {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                withAnimation {
                    viewModel.showMenu()
                }
            }, label: {
                MenuButton(iconName: "line.horizontal.3", text: "Back to Menu")
            })
            .padding()
            .accessibilityIdentifier(AccessibilityIdentifier.Tutorial.menuButton)
        }
    }
}

private struct TutorialNavigationNextButton: View {
    @ObservedObject var viewModel: TutorialViewModel
    
    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            withAnimation {
                viewModel.nextStep()
            }
        }, label: {
            MenuButton(iconName: "arrow.right", text: "Next", imageOnLeft: false)
        })
        .accessibilityIdentifier(AccessibilityIdentifier.Tutorial.nextButton)
    }
}

private struct TutorialNavigationBackButton: View {
    @ObservedObject var viewModel: TutorialViewModel
    
    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            withAnimation {
                viewModel.previousStep()
            }
        }, label: {
            MenuButton(iconName: "arrow.left", text: "Back")
        })
        .accessibilityIdentifier(AccessibilityIdentifier.Tutorial.previousButton)
    }
}
