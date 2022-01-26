//
//  LevelSelectionViewModelTests.swift
//  NBackGameTests
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import XCTest
@testable import NBackGame

class LevelSelectionViewModelTests: XCTestCase {

    func test_whenViewModelLoad_thenDefaultLevelIsReturned() throws {
        // given
        let gameCoordiantor = GameCoordinatorMock(expectation: nil)
        let useCase = GetHighestUnlockedLevelUseCaseMock()
        let useCases = LevelSelectionViewModelUseCases(getHighestUnlockedLevelUseCase: useCase)
        let sut = LevelSelectionViewModel(gameCoordinator: gameCoordiantor, useCases: useCases)
        
        // when
        sut.onAppear()

        // then
        XCTAssertEqual(sut.unlockedLevels, sut.defaultLevelUnlocked)
    }
    
    func test_whenUnlockedLevelSelected_thenStartPlay() throws {
        // given
        let expectation = self.expectation(description: "Level unlocked")
        let gameCoordiantor = GameCoordinatorMock(expectation: expectation)
        let useCase = GetHighestUnlockedLevelUseCaseMock()
        let useCases = LevelSelectionViewModelUseCases(getHighestUnlockedLevelUseCase: useCase)
        let sut = LevelSelectionViewModel(gameCoordinator: gameCoordiantor, useCases: useCases)
        
        // when
        sut.onAppear()
        sut.selectLevel(0)
        
        // then
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertEqual(gameCoordiantor.gameViewState, GameViewState.game)
    }
    
    func test_whenLockedLevelSelected_thenDontStartPlay() throws {
        // given
        let gameCoordiantor = GameCoordinatorMock(expectation: nil)
        let useCase = GetHighestUnlockedLevelUseCaseMock()
        let useCases = LevelSelectionViewModelUseCases(getHighestUnlockedLevelUseCase: useCase)
        let sut = LevelSelectionViewModel(gameCoordinator: gameCoordiantor, useCases: useCases)
        
        // when
        sut.onAppear()
        sut.selectLevel(Int.max)

        // then
        XCTAssertEqual(gameCoordiantor.gameViewState, GameViewState.levelSelection)
    }

    func test_whenBackToMenuClicked_thenShowMenu() throws {
        // given
        let expectation = self.expectation(description: "Level unlocked")
        let gameCoordiantor = GameCoordinatorMock(expectation: expectation)
        let useCase = GetHighestUnlockedLevelUseCaseMock()
        let useCases = LevelSelectionViewModelUseCases(getHighestUnlockedLevelUseCase: useCase)
        let sut = LevelSelectionViewModel(gameCoordinator: gameCoordiantor, useCases: useCases)

        // when
        sut.showMenu()

        // then
        waitForExpectations(timeout: 2.0, handler: nil)
        XCTAssertTrue(true)
    }
    
    // MARK: - Helper
    
    class GameCoordinatorMock: GameCoordinator {
        var gameViewState: GameViewState = .levelSelection
        
        var gameInfo: GameInfo
        var expectation: XCTestExpectation?
        
        init(expectation: XCTestExpectation?) {
            self.expectation = expectation
            gameInfo = GameInfo(history: [], level: 0)
        }
        
        func showMenu() {
            expectation?.fulfill()
        }
        
        func showLevelSelection() {
            expectation?.fulfill()
        }
        
        func selectLevel(_ level: Int) {
            gameViewState = .game
            expectation?.fulfill()
        }
        
        func playAgain() {
            expectation?.fulfill()
        }
        
        func showGameSummary(history: [HistoryItem], gameStartTime: Int64, gameEndTime: Int64) {
            expectation?.fulfill()
        }
    }
    
    class MenuCoordinatorMock: MenuCoordinator {
        var expectation: XCTestExpectation?
        
        init(expectation: XCTestExpectation?) {
            self.expectation = expectation
        
        }
        
        func showMenu() {
            expectation?.fulfill()
        }
        
        func showGame() {
            expectation?.fulfill()
        }
        
        func showTutorial() {
            expectation?.fulfill()
        }
        
        func showStatistics() {
            expectation?.fulfill()
        }
    }

    struct GetHighestUnlockedLevelUseCaseMock: GetHighestUnlockedLevelUseCase {
        func execute(completion: @escaping (Int?) -> Void) {
            completion(2)
        }
    }
}
