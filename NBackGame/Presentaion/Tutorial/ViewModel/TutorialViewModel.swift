//
//  TutorialViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 19/11/2020.
//

import Foundation

class TutorialViewModel: ObservableObject {
    let menuCoordinator: MenuCoordinator
    @Published var currentStep = 1
    let firstStep = 1
    let lastStep = 10
    
    init(menuCoordinator: MenuCoordinator) {
        self.menuCoordinator = menuCoordinator
        print("TutorialViewModel")
    }
    
    public func previousStep() {
        log("Tutorial previousStep")
        if currentStep <= 1 {
            return
        }
        currentStep -= 1
    }
    
    public func nextStep() {
        log("Tutorial nextStep")
        if currentStep >= lastStep {
            return
        }
        currentStep += 1
    }
    
    func showMenu() {
        log("Tutorial showMenu")
        menuCoordinator.showMenu()
    }
}
