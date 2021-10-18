//
//  GameViewModelTests.swift
//  NBackGameTests
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import XCTest
@testable import NBackGame

class GameViewModelTests: XCTestCase {

//    func test_whenGameStarts_thenSettingsReseted() throws {
//        // given
//        let gameLevel = 2
//        let gameViewModelActions = GameViewModelActionsMock()
//        let sut = GameViewModel(level: gameLevel, actions: gameViewModelActions)
//        
//        // when
//        sut.startGame()
//        
//        // then
//        XCTAssertEqual(sut.level, gameLevel)
//        XCTAssertFalse(sut.positionClicked)
//        XCTAssertFalse(sut.soundClicked)
//        XCTAssertEqual(sut.currentItem, CurrentGameItem.placeholder())
//        XCTAssertTrue(sut.history.isEmpty)
//        XCTAssertEqual(sut.currentRoundNumber, 0)
//
//    }
//    
//    func test_whenSelectPosition_thenItsSelected() throws {
//        // given
//        let gameLevel = 2
//        let gameViewModelActions = GameViewModelActionsMock()
//        let sut = GameViewModel(level: gameLevel, actions: gameViewModelActions)
//        
//        // when
//        sut.selectSound()
//        
//        // then
//        XCTAssertTrue(sut.soundClicked)
//    }
//    
//    func test_whenSelectSound_thenItsSelected() throws {
//        // given
//        let gameLevel = 2
//        let gameViewModelActions = GameViewModelActionsMock()
//        let sut = GameViewModel(level: gameLevel, actions: gameViewModelActions)
//        
//        // when
//        sut.selectPosition()
//        
//        // then
//        XCTAssertTrue(sut.positionClicked)
//    }
//    
//    func test_whenSelectShowMenu_thenShowMenu() throws {
//        // given
//        let gameLevel = 2
//        let gameViewModelActions = GameViewModelActionsMock(expectation:
//                                                                self.expectation(description: "Action executed"))
//        let sut = GameViewModel(level: gameLevel, actions: gameViewModelActions)
//        
//        // when
//        sut.showMenu()
//        
//        waitForExpectations(timeout: 2.0, handler: nil)
//        
//        // then
//        XCTAssertTrue(true)
//    }
//    
//    // MARK: - Helpers
//    
//    struct GameViewModelActionsMock: GameViewModelActions {
//        var expectation: XCTestExpectation?
//
//        var finishGame: ([HistoryItem]) -> Void
//        var showMenu: () -> Void
//
//        init(expectation: XCTestExpectation? = nil) {
//            self.expectation = expectation
//            finishGame = { _ in }
//            showMenu = {}
//            finishGame = finishGameMock
//            showMenu = showMenuMock
//        }
//        
//        func finishGameMock(historyItems: [HistoryItem]) { }
//        
//        func showMenuMock() {
//            expectation?.fulfill()
//        }
//    }
}
