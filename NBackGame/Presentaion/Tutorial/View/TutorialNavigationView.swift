//
//  TutorialNavigationView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 07/12/2020.
//

import SwiftUI

struct TutorialNavigationView: View {
    @ObservedObject var viewModel: TutorialViewModel
    
    var body: some View {
        HStack {
            if viewModel.currentStep != viewModel.firstStep {
                Spacer()
                Button(action: {
                    withAnimation {
                        viewModel.previousStep()
                    }
                }, label: {
                    ZStack {
                        PlayCircle()
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                        VStack {
                            Image(systemName: "arrow.left")
                                .font(.largeTitle)
                                .padding(0)
                            Text("Back")
                                .foregroundColor(.blue)
                                .padding(0)
                        }
                    }
                    .frame(width: 100, height: 100)
                })
                Spacer()
            }
            if viewModel.currentStep != viewModel.lastStep {
                Spacer()
                
                Button(action: {
                    withAnimation {
                        viewModel.nextStep()
                    }
                }, label: {
                    ZStack {
                        PlayCircle()
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                        VStack {
                            Image(systemName: "arrow.right")
                                .font(.largeTitle)
                                .padding(0)
                            Text("Next")
                                .foregroundColor(.blue)
                                .padding(0)
                        }
                    }
                    .frame(width: 100, height: 100)
                })
                Spacer()
            }
        }
    }
}
