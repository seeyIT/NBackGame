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
    var imageOnLeft: Bool = true
    var fixedWidth: CGFloat? = nil
    
    var body: some View {
        HStack {
            if imageOnLeft {
                Image(systemName: iconName)
                    .font(.largeTitle)
                Text(text)
                    .font(.headline)
            } else {
                Text(text)
                    .font(.headline)
                Image(systemName: iconName)
                    .font(.largeTitle)
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
                        MenuButton(iconName: "play.fill", text: "Play", fixedWidth: 220)
                    })
                    .padding(.bottom, 30)
                    .accessibilityIdentifier(AccessibilityIdentifier.Menu.playButton)
                    
                    NavigationLink(destination: TutorialView(viewModel: TutorialViewModel())) {
                        MenuButton(iconName: "book.fill", text: "Tutorial", fixedWidth: 220)
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
