//
//  TutorialViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 19/11/2020.
//

import Foundation

class TutorialViewModel: ObservableObject {
    
    @Published var currentStep = 1
    let firstStep = 1
    let lastStep = 10
    
    init() {
        print("TutorialViewModel")
    }
    
    public func previousStep() {
        if currentStep <= 1 {
            return
        }
        currentStep -= 1
    }
    
    public func nextStep() {
        if currentStep >= lastStep {
            return
        }
        currentStep += 1
    }
}
