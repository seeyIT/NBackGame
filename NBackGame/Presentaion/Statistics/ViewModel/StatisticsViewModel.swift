//
//  StatisticsViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 20/09/2021.
//

import SwiftUI

struct StatisticsViewModelUseCases {
    let getGamesHistoryUseCase: GetGamesHistoryUseCase
}

class StatisticsViewModel: ObservableObject {
    var menuCoordinator: MenuViewCoordinator
    let useCases: StatisticsViewModelUseCases
    
    @Published var history: [GameHistory] = []
    
    init(menuCoordinator: MenuViewCoordinator, useCases: StatisticsViewModelUseCases) {
        self.menuCoordinator = menuCoordinator
        self.useCases = useCases
    }
    
    func onAppear() {
        loadHistory()
    }
    
    func showMenu() {
        menuCoordinator.showMenu()
    }
    
    private func loadHistory() {
        DispatchQueue.global().async {
            self.useCases.getGamesHistoryUseCase.execute { result in
                DispatchQueue.main.async {
                    self.history = result.reversed()
                }
            }
        }
    }
}
