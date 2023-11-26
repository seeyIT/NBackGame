//
//  SplashScreenView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 26/11/2023.
//

import SwiftUI

struct SplashScreenView: View {
    @ObservedObject var viewModel: SplashScreenViewModel
    @State private var scaleEffect = 1.0
    @State private var rotationAngle = 0.0
    let animationDuration = 0.5
    
    var body: some View {
        ZStack {
            Color.black
            
            Image("LogoDark")
                .resizable()
                .frame(width: 128, height: 128)
                .scaleEffect(scaleEffect)
                .rotationEffect(Angle(degrees: rotationAngle))
                .animation(.linear(duration: animationDuration), value: scaleEffect)
                .animation(.linear(duration: animationDuration), value: rotationAngle)
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            self.scaleEffect = 1.8
            
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                self.scaleEffect = 0
                self.rotationAngle = 700
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration + animationDuration) {
                withAnimation {
                    viewModel.showMenu()
                }
            }
        })
    }
}
