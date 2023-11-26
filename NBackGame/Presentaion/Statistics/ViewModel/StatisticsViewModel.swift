//
//  StatisticsViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 20/09/2021.
//

import SwiftUI

struct StatisticsViewModelUseCases {
    let getGamesHistoryUseCase: GetGamesHistoryUseCase
    let removeGameHistoryUseCase: RemoveGameHistoryUseCase
}

class StatisticsViewModel: ObservableObject {
    var menuCoordinator: MenuCoordinator
    let useCases: StatisticsViewModelUseCases
    
    @Published var history: [GameHistory] = []
    
    var selectedGameHistory: GameHistory?
    
    init(menuCoordinator: MenuCoordinator, useCases: StatisticsViewModelUseCases) {
        self.menuCoordinator = menuCoordinator
        self.useCases = useCases
    }
    
    func onAppear() {
//        log("Statistics onAppear")
        loadHistory()
    }
    
    func showMenu() {
//        log("Statistics showMenu")
        menuCoordinator.showMenu()
    }
    
    func deleteSelectedGameHistory() {
        DispatchQueue.global().async {
            // memory leak
            if let uuid = self.selectedGameHistory?.uuid {
                self.useCases.removeGameHistoryUseCase.execute(uuid: uuid)
                
                self.useCases.getGamesHistoryUseCase.execute { result in
                    DispatchQueue.main.async {
                        // memory leak
                        self.history = result.reversed()
                    }
                }
            }
        }
    }
    
    private func loadHistory() {
        DispatchQueue.global().async {
            // memory leak
            self.useCases.getGamesHistoryUseCase.execute { result in
                DispatchQueue.main.async {
                    // memory leak
                    self.history = result.reversed()
                }
            }
        }
    }
}
