//
//  TutorialViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 19/11/2020.
//

import Foundation

class TutorialViewModel: ObservableObject {
    
    @Published var currentStep = 1
    var firstStep = 1
    var lastStep = 10
    
    init() {
        print("TutorialViewModel")
    }
    
    public func previousStep() {
        if currentStep <= 1 {
            return
        }
        print("previous step")
        currentStep -= 1
    }
    
    public func nextStep() {
        if currentStep >= lastStep {
            return
        }
        print("next step")
        currentStep += 1
        
    }
}
