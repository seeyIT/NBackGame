//
//  ContentView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 04/10/2020.
//

import SwiftUI
import Combine

struct MenuView: View {
    @ObservedObject var viewModel: MenuViewModel
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    private var buttonSize: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 320
        } else {
            return 220
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            viewModel.toggleMusic()
                        } label: {
                            Image(systemName: viewModel.currentMusicIcon)
                                .font(.largeTitle)
                                .padding()
                                .foregroundColor(.white)
                        }
                        .frame(width: 60, height: 60)
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        withAnimation {
                            viewModel.showGame()
                        }
                    }, label: {
                        MenuButton(iconName: "play.fill", text: "Play", fixedWidth: buttonSize)
                    })
                    .padding(.bottom, 30)
                    .accessibilityIdentifier(AccessibilityIdentifier.Menu.playButton)
                    
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        withAnimation {
                            viewModel.showTutorial()
                        }
                    }, label: {
                        MenuButton(iconName: "book.fill", text: "Tutorial", fixedWidth: buttonSize)
                    })
                    .padding(.bottom, 30)
                    .accessibilityIdentifier(AccessibilityIdentifier.Menu.tutorialButton)
                    
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        withAnimation {
                            viewModel.showStatistics()
                        }
                    }, label: {
                        MenuButton(iconName: "graduationcap.fill", text: "Statistics", fixedWidth: buttonSize)
                    })
                    .accessibilityIdentifier(AccessibilityIdentifier.Menu.statisticsButton)
                    
                    if verticalSizeClass == .regular {
                        QuotesView(viewModel: viewModel)
                            .padding(.top, 30)
                    }
                    Spacer()
                    Text("Music powered by @gabriele_pollina")
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .preferredColorScheme(.dark)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: {
            viewModel.onAppear()
        })
    }
    
}
