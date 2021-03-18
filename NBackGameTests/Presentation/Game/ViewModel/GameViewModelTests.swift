//
//  GameViewModelTests.swift
//  NBackGameTests
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import XCTest
@testable import NBackGame

class GameViewModelTests: XCTestCase {

    func test_whenGameStarts_thenSettingsReseted() throws {
        // given
        let gameLevel = 2
        let gameViewModelActions = GameViewModelActionsMock(finishGame: finishGameMock)
        let sut = GameViewModel(level: gameLevel, actions: gameViewModelActions)
        
        // when
        sut.startGame()
        
        // then
        XCTAssertEqual(sut.level, gameLevel)
        XCTAssertFalse(sut.positionClicked)
        XCTAssertFalse(sut.soundClicked)
        XCTAssertEqual(sut.currentItem, CurrentGameItem.placeholder())
        XCTAssertTrue(sut.history.isEmpty)
        XCTAssertEqual(sut.currentRoundNumber, 0)

    }
    
    func test_whenSelectPosition_thenItsSelected() throws {
        // given
        let gameLevel = 2
        let gameViewModelActions = GameViewModelActionsMock(finishGame: finishGameMock)
        let sut = GameViewModel(level: gameLevel, actions: gameViewModelActions)
        
        // when
        sut.selectSound()
        
        // then
        XCTAssertTrue(sut.soundClicked)
    }
    
    func test_whenSelectSound_thenItsSelected() throws {
        // given
        let gameLevel = 2
        let gameViewModelActions = GameViewModelActionsMock(finishGame: finishGameMock)
        let sut = GameViewModel(level: gameLevel, actions: gameViewModelActions)
        
        // when
        sut.selectPosition()
        
        // then
        XCTAssertTrue(sut.positionClicked)
    }
    
    // MARK: - Helpers
    
    func finishGameMock(historyItems: [HistoryItem]) {
        
    }
    
    struct GameViewModelActionsMock: GameViewModelActions {
        var finishGame: ([HistoryItem]) -> Void
    }
}

