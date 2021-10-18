//
//  GameSummaryViewModelTests.swift
//  NBackGameTests
//
//  Created by Kornel Miszczak on 19/02/2021.
//

import XCTest
@testable import NBackGame

class GameSummaryViewModelTests: XCTestCase {
    
//    func test_whenDefaultViewModelAppears_thenBothUseCasesExecute() throws {
//        // given
//        let actions = GameSummaryViewModelActionsMock(playAgain: actionsMock, showMenu: actionsMock)
//        let calculateGameResultsUseCase = CalculateGameResultsUseCaseMock()
//        calculateGameResultsUseCase.expectation = self.expectation(description: "Results calculated")
//        let unlockNextLevelUseCase = UnlockNextLevelUseCaseMock()
//        unlockNextLevelUseCase.expectation = self.expectation(description: "Try unlock next level")
//        let useCases = GameSummaryViewModelUseCases(calculateGameResult: calculateGameResultsUseCase, unlockNextLevelUseCase: unlockNextLevelUseCase)
//        let sut = GameSummaryViewModel(gameInfo: GameInfo(history: [], level: 2), actions: actions, useCases: useCases)
//        
//        // when
//        sut.onAppear()
//        
//        // then
//        waitForExpectations(timeout: 5.0, handler: nil)
//    }
//    
//    func test_whenPlayAgainActionClicked_thenPlayAgain() throws {
//        // given
//        let actions = GameSummaryViewModelActionsMock(playAgain: actionsMock, showMenu: actionsMock, expectation: self.expectation(description: "Play again clicked!"))
//        let calculateGameResultsUseCase = CalculateGameResultsUseCaseMock()
//        let unlockNextLevelUseCase = UnlockNextLevelUseCaseMock()
//        let useCases = GameSummaryViewModelUseCases(calculateGameResult: calculateGameResultsUseCase, unlockNextLevelUseCase: unlockNextLevelUseCase)
//        
//        let sut = GameSummaryViewModel(gameInfo: GameInfo(history: [], level: 0), actions: actions, useCases: useCases)
//        
//        // when
//        sut.playAgain()
//        
//        // then
//        waitForExpectations(timeout: 2.0, handler: nil)
//    }
//    
//    func test_whenShowMenuActionClicked_thenShowMenu() throws {
//        // given
//        let actions = GameSummaryViewModelActionsMock(playAgain: actionsMock, showMenu: actionsMock, expectation: self.expectation(description: "Show menu clicked!"))
//        let calculateGameResultsUseCase = CalculateGameResultsUseCaseMock()
//        let unlockNextLevelUseCase = UnlockNextLevelUseCaseMock()
//        let useCases = GameSummaryViewModelUseCases(calculateGameResult: calculateGameResultsUseCase, unlockNextLevelUseCase: unlockNextLevelUseCase)
//        
//        let sut = GameSummaryViewModel(gameInfo: GameInfo(history: [], level: 0), actions: actions, useCases: useCases)
//        
//        // when
//        sut.showMenu()
//        
//        // then
//        waitForExpectations(timeout: 2.0, handler: nil)
//    }
//    
//    // MARK: - Helpers
//    
//    private func actionsMock() {
//        
//    }
//    
//    private enum UnlockNextLevelUseCaseError: Error {
//        case cantUnlock
//    }
//    
//    private class UnlockNextLevelUseCaseMock: UnlockNextLevelUseCase {
//        var expectation: XCTestExpectation?
//        var error: Error?
//        
//        func execute(level: Int, gameResults: GameResults, completion: @escaping (Result<Int, Error>) -> Void) {
//            if let error = error {
//                completion(.failure(error))
//            } else {
//                completion(.success(level))
//            }
//            expectation?.fulfill()
//        }
//    }
//    
//    private class CalculateGameResultsUseCaseMock: CalculateGameResultsUseCase {
//        var expectation: XCTestExpectation?
//        
//        func execute(history: [HistoryItem], level: Int, completion: @escaping (GameResults) -> Void) {
//            var gameResults = GameResults()
//            gameResults.correctSelectionSound = 1
//            gameResults.correctSelectionPosition = 1
//            completion(gameResults)
//            expectation?.fulfill()
//        }
//    }
//    
//    private struct GameSummaryViewModelActionsMock: GameSummaryViewModelActions {
//        var playAgain: () -> Void
//        var showMenu: () -> Void
//        var expectation: XCTestExpectation?
//        
//        init(playAgain: @escaping () -> Void, showMenu: @escaping () -> Void, expectation: XCTestExpectation? = nil) {
//            self.showMenu = showMenu
//            self.playAgain = playAgain
//            self.expectation = expectation
//            self.playAgain = playAgainTest
//            self.showMenu = showMenuTest
//        }
//        
//        func playAgainTest() {
//            expectation?.fulfill()
//        }
//        
//        func showMenuTest() {
//            expectation?.fulfill()
//        }
//    }
    
}
