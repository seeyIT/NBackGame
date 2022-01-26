//
//  CalculateGameResultsUseCaseTests.swift
//  NBackGameTests
//
//  Created by Kornel Miszczak on 11/03/2021.
//

import XCTest
@testable import NBackGame

// swiftlint:disable type_body_length
class CalculateGameResultsUseCaseTests: XCTestCase {
    
    func test_whenGameHistoryEmpty_thenGameResultWithZeros() throws {
        // given
        let expectation = self.expectation(description: "Game result calculated")
        let history: [HistoryItem] = []
        let level = 2
        var gameResults = GameResults()
        let sut = DefaultCalculateGameResultsUseCase()

        // when
        sut.execute(history: history, level: level) { result in
            gameResults = result
            expectation.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(gameResults.correctSelectionPosition, 0)
        XCTAssertEqual(gameResults.correctSelectionSound, 0)
        XCTAssertEqual(gameResults.missedSelectionPosition, 0)
        XCTAssertEqual(gameResults.missedSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionPosition, 0)
        XCTAssertEqual(gameResults.incorrectSelectionSound, 0)
    }
    
    func test_whenPlayerSelectedCorrectPositionOnceInLevel2_thenSingleCorrectSelection() {
        // given
        let expectation = self.expectation(description: "Game result calculated")
        let history = [
            HistoryItem(roundNumber: 1, position: 1, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 2, position: 2, sound: "l", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 3, position: 1, sound: "p", positionClicked: true, soundClicked: false)
        ]
        let level = 2
        let sut = DefaultCalculateGameResultsUseCase()
        var gameResults = GameResults()
        
        // when
        sut.execute(history: history, level: level) { result in
            gameResults = result
            expectation.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(gameResults.correctSelectionPosition, 1)
        XCTAssertEqual(gameResults.correctSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionPosition, 0)
        XCTAssertEqual(gameResults.missedSelectionSound, 0)
        XCTAssertEqual(gameResults.missedSelectionPosition, 0)
    }
    
    func test_whenPlayerSelectedCorrectSoundOnceInLevel2_thenSingleCorrectSelection() throws {
        // given
        let expectation = self.expectation(description: "Game result calculated")
        let history = [
            HistoryItem(roundNumber: 1, position: 1, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 2, position: 2, sound: "l", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 3, position: 3, sound: "k", positionClicked: false, soundClicked: true)
        ]
        let level = 2
        let sut = DefaultCalculateGameResultsUseCase()
        var gameResults = GameResults()
        
        // when
        sut.execute(history: history, level: level) { result in
            gameResults = result
            expectation.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(gameResults.correctSelectionPosition, 0)
        XCTAssertEqual(gameResults.correctSelectionSound, 1)
        XCTAssertEqual(gameResults.missedSelectionPosition, 0)
        XCTAssertEqual(gameResults.missedSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionPosition, 0)
        XCTAssertEqual(gameResults.incorrectSelectionSound, 0)
    }
    
    func test_whenPlayerSelectedIncorrectSoundOnceInLevel2_thenSingleIncorrectSelection() {
        // given
        let expectation = self.expectation(description: "Game result calculated")
        let history = [
            HistoryItem(roundNumber: 1, position: 1, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 2, position: 2, sound: "l", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 3, position: 3, sound: "p", positionClicked: false, soundClicked: true)
        ]
        
        let level = 2
        let sut = DefaultCalculateGameResultsUseCase()
        var gameResults = GameResults()
        
        // when
        sut.execute(history: history, level: level) { result in
            gameResults = result
            expectation.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(gameResults.correctSelectionPosition, 0)
        XCTAssertEqual(gameResults.correctSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionSound, 1)
        XCTAssertEqual(gameResults.incorrectSelectionPosition, 0)
        XCTAssertEqual(gameResults.missedSelectionSound, 0)
        XCTAssertEqual(gameResults.missedSelectionPosition, 0)
    }
    
    func test_whenPlayerSelectedIncorrectPositionOnceInLevel2_thenSingleIncorrectSelection() {
        // given
        let expectation = self.expectation(description: "Game result calculated")
        let history = [
            HistoryItem(roundNumber: 1, position: 1, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 2, position: 2, sound: "l", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 3, position: 3, sound: "p", positionClicked: true, soundClicked: false)
        ]
        
        let level = 2
        let sut = DefaultCalculateGameResultsUseCase()
        var gameResults = GameResults()
        
        // when
        sut.execute(history: history, level: level) { result in
            gameResults = result
            expectation.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(gameResults.correctSelectionPosition, 0)
        XCTAssertEqual(gameResults.correctSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionPosition, 1)
        XCTAssertEqual(gameResults.missedSelectionSound, 0)
        XCTAssertEqual(gameResults.missedSelectionPosition, 0)
    }
    
    func test_whenPlayerMissedSoundOnceInLevel2_thenSingleMiss() {
        // given
        let expectation = self.expectation(description: "Game result calculated")
        let history = [
            HistoryItem(roundNumber: 1, position: 1, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 2, position: 2, sound: "l", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 3, position: 3, sound: "k", positionClicked: false, soundClicked: false)
        ]
        
        let level = 2
        let sut = DefaultCalculateGameResultsUseCase()
        var gameResults = GameResults()
        
        // when
        sut.execute(history: history, level: level) { result in
            gameResults = result
            expectation.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(gameResults.correctSelectionPosition, 0)
        XCTAssertEqual(gameResults.correctSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionPosition, 0)
        XCTAssertEqual(gameResults.missedSelectionSound, 1)
        XCTAssertEqual(gameResults.missedSelectionPosition, 0)
    }
    
    func test_whenPlayerMissedPositionOnceInLevel2_thenSingleMiss() {
        // given
        let expectation = self.expectation(description: "Game result calculated")
        let history = [
            HistoryItem(roundNumber: 1, position: 1, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 2, position: 2, sound: "l", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 3, position: 1, sound: "p", positionClicked: false, soundClicked: false)
        ]
        
        let level = 2
        let sut = DefaultCalculateGameResultsUseCase()
        var gameResults = GameResults()
        
        // when
        sut.execute(history: history, level: level) { result in
            gameResults = result
            expectation.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(gameResults.correctSelectionPosition, 0)
        XCTAssertEqual(gameResults.correctSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionPosition, 0)
        XCTAssertEqual(gameResults.missedSelectionSound, 0)
        XCTAssertEqual(gameResults.missedSelectionPosition, 1)
    }
    
    func test_whenManySelectionBeforeCountingInLevel9_thenSingleSelection() throws {
        // given
        let expectation = self.expectation(description: "Game result calculated")
        let history = [
            HistoryItem(roundNumber: 1, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 2, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 3, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 4, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 5, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 6, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 7, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 8, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 9, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 10, position: 1, sound: "t", positionClicked: true, soundClicked: true)
        ]
        
        let level = 9
        let sut = DefaultCalculateGameResultsUseCase()
        var gameResults = GameResults()
        
        // when
        sut.execute(history: history, level: level) { result in
            gameResults = result
            expectation.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(gameResults.correctSelectionPosition, 1)
        XCTAssertEqual(gameResults.correctSelectionSound, 1)
        XCTAssertEqual(gameResults.incorrectSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionPosition, 0)
        XCTAssertEqual(gameResults.missedSelectionSound, 0)
        XCTAssertEqual(gameResults.missedSelectionPosition, 0)
    }
    
    func test_whenManySelectionBeforeCountingInLevel10_thenNoSelectionDetected() throws {
        // given
        let expectation = self.expectation(description: "Game result calculated")
        let history = [
            HistoryItem(roundNumber: 1, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 2, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 3, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 4, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 5, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 6, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 7, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 8, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 9, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 10, position: 1, sound: "t", positionClicked: true, soundClicked: true),
            HistoryItem(roundNumber: 11, position: 2, sound: "g", positionClicked: false, soundClicked: false)
        ]
        
        let level = 10
        let sut = DefaultCalculateGameResultsUseCase()
        var gameResults = GameResults()
        
        // when
        sut.execute(history: history, level: level) { result in
            gameResults = result
            expectation.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(gameResults.correctSelectionPosition, 0)
        XCTAssertEqual(gameResults.correctSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionSound, 0)
        XCTAssertEqual(gameResults.incorrectSelectionPosition, 0)
        XCTAssertEqual(gameResults.missedSelectionSound, 0)
        XCTAssertEqual(gameResults.missedSelectionPosition, 0)
    }
    
    func test_whenSampleGameInLevel5_thenManySelections() throws {
        // given
        let expectation = self.expectation(description: "Game result calculated")
        let history = [
            HistoryItem(roundNumber: 1, position: 4, sound: "t", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 2, position: 3, sound: "g", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 3, position: 6, sound: "d", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 4, position: 4, sound: "p", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 5, position: 3, sound: "p", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 6, position: 1, sound: "l", positionClicked: true, soundClicked: false), // incorrect position
            HistoryItem(roundNumber: 7, position: 4, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 8, position: 3, sound: "l", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 9, position: 3, sound: "p", positionClicked: false, soundClicked: false), // sound missed
            HistoryItem(roundNumber: 10, position: 1, sound: "d", positionClicked: true, soundClicked: false), // incorrect position
            HistoryItem(roundNumber: 11, position: 1, sound: "t", positionClicked: false, soundClicked: true), // position missed
            HistoryItem(roundNumber: 12, position: 7, sound: "b", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 13, position: 4, sound: "d", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 14, position: 2, sound: "g", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 15, position: 2, sound: "b", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 16, position: 6, sound: "d", positionClicked: true, soundClicked: true), // incorrect position and sound
            HistoryItem(roundNumber: 17, position: 7, sound: "k", positionClicked: false, soundClicked: false), // position missed
            HistoryItem(roundNumber: 18, position: 8, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 19, position: 3, sound: "m", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 20, position: 1, sound: "l", positionClicked: false, soundClicked: true), // incorrect sound
            HistoryItem(roundNumber: 21, position: 0, sound: "s", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 22, position: 0, sound: "p", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 23, position: 3, sound: "g", positionClicked: false, soundClicked: false),
            HistoryItem(roundNumber: 24, position: 5, sound: "l", positionClicked: false, soundClicked: true), // incorrect sound
            HistoryItem(roundNumber: 25, position: 1, sound: "l", positionClicked: true, soundClicked: true) // correct position and sound
        ]
        
        let level = 5
        let sut = DefaultCalculateGameResultsUseCase()
        var gameResults = GameResults()
        
        // when
        sut.execute(history: history, level: level) { result in
            gameResults = result
            expectation.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(gameResults.correctSelectionPosition, 1)
        XCTAssertEqual(gameResults.correctSelectionSound, 1)
        XCTAssertEqual(gameResults.incorrectSelectionSound, 4)
        XCTAssertEqual(gameResults.incorrectSelectionPosition, 3)
        XCTAssertEqual(gameResults.missedSelectionSound, 1)
        XCTAssertEqual(gameResults.missedSelectionPosition, 2)
    }
    
}
