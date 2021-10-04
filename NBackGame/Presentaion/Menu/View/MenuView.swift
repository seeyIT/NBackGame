//
//  ContentView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 04/10/2020.
//

import SwiftUI

struct PlayShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX - rect.midX / 4, y: rect.midY - rect.midY / 3))
        path.addLine(to: CGPoint(x: rect.midX + rect.midX / 3, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX - rect.midX / 4, y: rect.midY + rect.midY / 3))
        path.addLine(to: CGPoint(x: rect.midX - rect.midX / 4, y: rect.midY - rect.midY / 3))
        return path
    }
}

struct PlayCircle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: Angle.zero, endAngle: Angle(radians: .pi * 2), clockwise: true)
        
        return path
    }
}

struct MenuButton: View {
    @ScaledMetric var imageSize: CGFloat = 40
    
    var iconName: String
    var text: String
    var imageOnLeft: Bool = true
    var fixedWidth: CGFloat?
    
    var body: some View {
        HStack {
            if imageOnLeft {
                Image(systemName: iconName)
                    .font(.largeTitle)
                    .frame(width: imageSize, height: imageSize)
                Text(text)
                    .font(.headline)
                    .frame(alignment: .center)
            } else {
                Text(text)
                    .font(.headline)
                    .frame(alignment: .center)
                Image(systemName: iconName)
                    .font(.largeTitle)
                    .frame(width: imageSize, height: imageSize)
            }
        }
        .padding()
        .foregroundColor(Color.blue)
        .ifLet(fixedWidth) { $0.frame(width: $1) }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.blue, lineWidth: 2)
                .foregroundColor(Color.yellow)
        )
    }
}

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
                    .accessibilityIdentifier(AccessibilityIdentifier.Menu.tutorialButton)
                    
                    if verticalSizeClass == .regular {
                        QuotesView(viewModel: viewModel)
                            .padding(.top, 30)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .preferredColorScheme(.dark)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}
