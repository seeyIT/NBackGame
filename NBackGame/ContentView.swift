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

struct PlayButton: View {
    
    @Binding var press: Bool
    
    var body: some View {
        ZStack {
            if press {
                PlayCircle()
                    .foregroundColor(Color.blue)
                VStack {
                    PlayShape()
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                        .background(PlayShape().foregroundColor(Color.white))
                    Text("Play")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.white)
                }
            } else {
                PlayCircle()
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                VStack {
                    PlayShape()
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                        .background(PlayShape().foregroundColor(Color.blue))
                    Text("Play")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.blue)
                }
                
                
            }
            
        }
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


struct ContentView: View {
    
    @State private var press = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    NavigationLink(destination: GameView(press: self.$press), isActive: $press) {
                        //                        NavigationLink(destination: LevelSelectionView(viewModel: LevelSelectionViewModel()), isActive: $press) {
                        //                        PlayButton(press: $press)
                        MenuButton(iconName: "play.fill", text: "Play")
                            
                        
                        //                        .simultaneousGesture(
                        //                            DragGesture(minimumDistance: 0)
                        //                                .onChanged { _ in
                        //                                    press = true
                        //                                }
                        //                                .onEnded { _ in
                        //                                    press = false
                        //                                }
                        //                        )
                    }
                    .padding(.bottom, 30)
                    NavigationLink(destination: TutorialView(viewModel: TutorialViewModel())) {
                        MenuButton(iconName: "book.fill", text: "Tutorial")
                        //                            .frame(width: 200, height: 200)
                    }
                }
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .preferredColorScheme(.dark)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
