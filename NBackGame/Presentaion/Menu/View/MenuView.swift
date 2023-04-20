//
//  ContentView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 04/10/2020.
//

import SwiftUI
import Combine
import MessageUI

struct MenuView: View {
    @ObservedObject var viewModel: MenuViewModel
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State var isShowingMailView = false
    
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
                                .foregroundColor(.white)
                                .padding()
                        }
                        .frame(width: 60, height: 60)
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    MenuButton(
                        leftIconName: "play.fill",
                        text: "Play",
                        fixedWidth: buttonSize,
                        accessibilityIdentifier: AccessibilityIdentifier.Menu.playButton,
                        onTapFeedbackImpact: .heavy,
                        onTap: {
                            withAnimation {
                                viewModel.showGame()
                            }
                        }
                    )
                    .padding(.bottom, 16)
                    
                    MenuButton(
                        leftIconName: "book.fill",
                        text: "Tutorial",
                        fixedWidth: buttonSize,
                        accessibilityIdentifier: AccessibilityIdentifier.Menu.tutorialButton,
                        onTapFeedbackImpact: .heavy,
                        onTap: {
                            withAnimation {
                                viewModel.showTutorial()
                            }
                        }
                    )
                    .padding(.bottom, 16)
                    
                    MenuButton(
                        leftIconName: "graduationcap.fill",
                        text: "Statistics",
                        fixedWidth: buttonSize,
                        accessibilityIdentifier: AccessibilityIdentifier.Menu.statisticsButton,
                        onTapFeedbackImpact: .heavy,
                        onTap: {
                            withAnimation {
                                viewModel.showStatistics()
                            }
                        }
                    )
                    .padding(.bottom, 16)
                    
                    if MFMailComposeViewController.canSendMail() {
                        MenuButton(
                            leftIconName: "pencil",
                            text: "Stay in touch",
                            fixedWidth: buttonSize,
                            accessibilityIdentifier: AccessibilityIdentifier.Menu.statisticsButton,
                            onTapFeedbackImpact: .heavy,
                            onTap: {
                                isShowingMailView.toggle()
                            }
                        )
                        .padding(.bottom, 16)
                    
                    }
                    
                    if verticalSizeClass == .regular {
                        QuotesView(viewModel: viewModel)
                            .padding(.top, 16)
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
        .sheet(isPresented: $isShowingMailView) {
            MailView()
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
    }
}


