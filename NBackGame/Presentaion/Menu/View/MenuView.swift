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
        
        path.move(to: CGPoint(x: rect.midX - rect.midX / 4 , y: rect.midY - rect.midY / 3))
        path.addLine(to: CGPoint(x: rect.midX + rect.midX / 3 , y: rect.midY))
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
    
    var iconName: String
    var text: String
    
    var body: some View {
        
        VStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .padding(.top, 20)
            Text(text)
                .font(.body)
                .foregroundColor(Color.blue)
                .padding()
        }
        .frame(width: 130, height: 130)
        .overlay(
            Circle()
                .stroke(Color.blue, lineWidth: 2)
        )
    }
}


struct MenuView: View {
    
    @State private var press = false
    @ObservedObject var viewModel: MenuViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Button(action: {
                        withAnimation {
                            viewModel.startGame()
                        }
                    }, label: {
                        MenuButton(iconName: "play.fill", text: "Play")
                        
                    })
                    .padding(.bottom, 30)
                    .accessibilityIdentifier(AccessibilityIdentifier.Menu.playButton)
                    
                    NavigationLink(destination: TutorialView(viewModel: TutorialViewModel())) {
                        MenuButton(iconName: "book.fill", text: "Tutorial")
                    }
                    .accessibilityIdentifier(AccessibilityIdentifier.Menu.tutorialButton)

                }
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .preferredColorScheme(.dark)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView(viewModel: MenuViewModel(viewState: ViewState(.menu)))
//    }
//}
