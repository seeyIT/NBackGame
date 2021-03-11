//
//  GameSummaryViewModelTests.swift
//  NBackGameTests
//
//  Created by Kornel Miszczak on 19/02/2021.
//

import XCTest
@testable import NBackGame

class GameSummaryViewModelTests: XCTestCase {
    
    private func actionsMock() {
        
    }
    
    
    private enum UnlockNextLevelUseCaseError: Error {
        case cantUnlock
    }
    
    class UnlockNextLevelUseCaseMock: UnlockNextLevelUseCase {
        var expectation: XCTestExpectation?
        var error: Error?
        
        func execute(level: Int, gameResults: GameResults, completion: @escaping (Result<Int, Error>) -> Void) {
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(level))
            }
            expectation?.fulfill()
        }
    }
    
    class CalculateGameResultsUseCaseMock: CalculateGameResultsUseCase {
        var expectation: XCTestExpectation?
        
        func execute(history: [HistoryItem], level: Int, completion: @escaping (GameResults) -> Void) {            
            var gameResults = GameResults()
            gameResults.correctSelectionSound = 1
            gameResults.correctSelectionPosition = 1
            completion(gameResults)
            expectation?.fulfill()
        }
    }
    
    func test_whenDefaultViewModelAppears_thenBothUseCasesExecute() throws {
        // given
        let actions = GameSummaryViewModelActions(playAgain: actionsMock, showMenu: actionsMock)
        let calculateGameResultsUseCase = CalculateGameResultsUseCaseMock()
        calculateGameResultsUseCase.expectation = self.expectation(description: "Results calculated")
        let unlockNextLevelUseCase = UnlockNextLevelUseCaseMock()
        unlockNextLevelUseCase.expectation = self.expectation(description: "Try unlock next level")
        let useCases = GameSummaryViewModelUseCases(calculateGameResult: calculateGameResultsUseCase, unlockNextLevelUseCase: unlockNextLevelUseCase)
        let viewModel = GameSummaryViewModel(gameInfo: GameInfo(history: [], level: 2), actions: actions, useCases: useCases)
        
        // when
        viewModel.onAppear()
        
        // then
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
