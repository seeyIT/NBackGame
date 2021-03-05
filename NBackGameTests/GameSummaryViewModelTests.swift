//
//  GameSummaryViewModelTests.swift
//  NBackGameTests
//
//  Created by Kornel Miszczak on 19/02/2021.
//

import XCTest
@testable import NBackGame

class GameSummaryViewModelTests: XCTestCase {
    
    func actionsMock() {
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    
    func test_whenViewDefaultViewModelAppearsWithoutHistory_thenCanUnlockNextLevel() throws {
        // given
        let actions = GameSummaryViewModelActions(playAgain: actionsMock, showMenu: actionsMock)
        let viewModel = GameSummaryViewModel(gameInfo: GameInfo(history: [], nBack: 2), actions: actions, repository: GameRepository())
        
        // then
        XCTAssertTrue(viewModel.canUnlockNextLevel())
    }
    
    func test_whenSoundMissedWithoutHistory_thenCantUnlockNextLevel() throws {
        // given
        let actions = GameSummaryViewModelActions(playAgain: actionsMock, showMenu: actionsMock)
        let viewModel = GameSummaryViewModel(gameInfo: GameInfo(history: [], nBack: 2), actions: actions, repository: GameRepository())
        
        // when
        viewModel.missedSelectionSound = 1
        
        // then
        XCTAssertFalse(viewModel.canUnlockNextLevel())
    }
    
    func test_whenPositionMissedWithoutHistory_thenCantUnlockNextLevel() throws {
        // given
        let actions = GameSummaryViewModelActions(playAgain: actionsMock, showMenu: actionsMock)
        let viewModel = GameSummaryViewModel(gameInfo: GameInfo(history: [], nBack: 2), actions: actions, repository: GameRepository())
        
        // when
        viewModel.missedSelectionPosition = 1
        
        // then
        XCTAssertFalse(viewModel.canUnlockNextLevel())
    }
    
    func test_whenSoundIncorrectWithoutHistory_thenCantUnlockNextLevel() throws {
        // given
        let actions = GameSummaryViewModelActions(playAgain: actionsMock, showMenu: actionsMock)
        let viewModel = GameSummaryViewModel(gameInfo: GameInfo(history: [], nBack: 2), actions: actions, repository: GameRepository())
        
        // when
        viewModel.incorrectSelectionSound = 1
        
        // then
        XCTAssertFalse(viewModel.canUnlockNextLevel())
    }
    
    func test_whenPositionIncorrectWithoutHistory_thenCantUnlockNextLevel() throws {
        // given
        let actions = GameSummaryViewModelActions(playAgain: actionsMock, showMenu: actionsMock)
        let viewModel = GameSummaryViewModel(gameInfo: GameInfo(history: [], nBack: 2), actions: actions, repository: GameRepository())
        
        // when
        viewModel.incorrectSelectionPosition = 1
        
        // then
        XCTAssertFalse(viewModel.canUnlockNextLevel())
    }
    
    func test_whenCorrectSelectionWithoutHistory_thenCanUnlockNextLevel() throws {
        // given
        let actions = GameSummaryViewModelActions(playAgain: actionsMock, showMenu: actionsMock)
        let viewModel = GameSummaryViewModel(gameInfo: GameInfo(history: [], nBack: 2), actions: actions, repository: GameRepository())
        
        // when
        viewModel.correctSelectionSound = 1
        viewModel.correctSelectionPosition = 1
        
        // then
        XCTAssertTrue(viewModel.canUnlockNextLevel())
    }
    

    func test_whenPlayerSelectedCorrectPositionOnceForN2_thenCanUnlockNextLevel() {
        // given
        let history = [
            HistoryItem(position: 1, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(position: 2, sound: "l", positionClicked: false, soundClicked: false),
            HistoryItem(position: 1, sound: "p", positionClicked: true, soundClicked: false),
        ]
        
        let actions = GameSummaryViewModelActions(playAgain: actionsMock, showMenu: actionsMock)
        let viewModel = GameSummaryViewModel(gameInfo: GameInfo(history: history, nBack: 2), actions: actions, repository: GameRepository())
       
        // when
        viewModel.onAppear()
        
        // then
        XCTAssertEqual(viewModel.correctSelectionPosition, 1)
        XCTAssertEqual(viewModel.correctSelectionSound, 0)
        XCTAssertEqual(viewModel.incorrectSelectionSound, 0)
        XCTAssertEqual(viewModel.incorrectSelectionPosition, 0)
        XCTAssertEqual(viewModel.missedSelectionSound, 0)
        XCTAssertEqual(viewModel.missedSelectionPosition, 0)

        XCTAssertTrue(viewModel.canUnlockNextLevel())
    }
    
    func test_whenPlayerSelectedCorrectSoundOnceForN2_thenCanUnlockNextLevel() {
        // given
        let history = [
            HistoryItem(position: 1, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(position: 2, sound: "l", positionClicked: false, soundClicked: false),
            HistoryItem(position: 3, sound: "k", positionClicked: false, soundClicked: true),
        ]
        
        let actions = GameSummaryViewModelActions(playAgain: actionsMock, showMenu: actionsMock)
        let viewModel = GameSummaryViewModel(gameInfo: GameInfo(history: history, nBack: 2), actions: actions, repository: GameRepository())
       
        // when
        viewModel.onAppear()
        
        // then
        XCTAssertEqual(viewModel.correctSelectionPosition, 0)
        XCTAssertEqual(viewModel.correctSelectionSound, 1)
        XCTAssertEqual(viewModel.incorrectSelectionSound, 0)
        XCTAssertEqual(viewModel.incorrectSelectionPosition, 0)
        XCTAssertEqual(viewModel.missedSelectionSound, 0)
        XCTAssertEqual(viewModel.missedSelectionPosition, 0)

        XCTAssertTrue(viewModel.canUnlockNextLevel())
    }
    
    func test_whenPlayerSelectedIncorrectPositionOnceForN2_thenCantUnlockNextLevel() {
        // given
        let history = [
            HistoryItem(position: 1, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(position: 2, sound: "l", positionClicked: false, soundClicked: false),
            HistoryItem(position: 3, sound: "p", positionClicked: true, soundClicked: false),
        ]
        
        let actions = GameSummaryViewModelActions(playAgain: actionsMock, showMenu: actionsMock)
        let viewModel = GameSummaryViewModel(gameInfo: GameInfo(history: history, nBack: 2), actions: actions, repository: GameRepository())
        
        // when
        viewModel.onAppear()
        
        // then
        XCTAssertEqual(viewModel.correctSelectionPosition, 0)
        XCTAssertEqual(viewModel.correctSelectionSound, 0)
        XCTAssertEqual(viewModel.incorrectSelectionSound, 0)
        XCTAssertEqual(viewModel.incorrectSelectionPosition, 1)
        XCTAssertEqual(viewModel.missedSelectionSound, 0)
        XCTAssertEqual(viewModel.missedSelectionPosition, 0)

        XCTAssertFalse(viewModel.canUnlockNextLevel())
    }
    
    func test_whenPlayerSelectedIncorrectSoundOnceForN2_thenCantUnlockNextLevel() {
        // given
        let history = [
            HistoryItem(position: 1, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(position: 2, sound: "l", positionClicked: false, soundClicked: false),
            HistoryItem(position: 3, sound: "p", positionClicked: false, soundClicked: true),
        ]
        
        let actions = GameSummaryViewModelActions(playAgain: actionsMock, showMenu: actionsMock)
        let viewModel = GameSummaryViewModel(gameInfo: GameInfo(history: history, nBack: 2), actions: actions, repository: GameRepository())
       
        // when
        viewModel.onAppear()
        
        // then
        XCTAssertEqual(viewModel.correctSelectionPosition, 0)
        XCTAssertEqual(viewModel.correctSelectionSound, 0)
        XCTAssertEqual(viewModel.incorrectSelectionSound, 1)
        XCTAssertEqual(viewModel.incorrectSelectionPosition, 0)
        XCTAssertEqual(viewModel.missedSelectionSound, 0)
        XCTAssertEqual(viewModel.missedSelectionPosition, 0)
        
        XCTAssertFalse(viewModel.canUnlockNextLevel())
    }
    
    func test_whenSampleGameForN5_thenCantUnlockNextLevel() {
        // given
        let history = [
            HistoryItem(position: 1, sound: "k", positionClicked: false, soundClicked: false),
            HistoryItem(position: 2, sound: "l", positionClicked: false, soundClicked: false),
            HistoryItem(position: 3, sound: "p", positionClicked: false, soundClicked: true),
        ]
        
        let actions = GameSummaryViewModelActions(playAgain: actionsMock, showMenu: actionsMock)
        let viewModel = GameSummaryViewModel(gameInfo: GameInfo(history: history, nBack: 2), actions: actions, repository: GameRepository())
       
        // when
        viewModel.onAppear()
        
        // then
        XCTAssertEqual(viewModel.correctSelectionPosition, 0)
        XCTAssertEqual(viewModel.correctSelectionSound, 0)
        XCTAssertEqual(viewModel.incorrectSelectionSound, 1)
        XCTAssertEqual(viewModel.incorrectSelectionPosition, 0)
        XCTAssertEqual(viewModel.missedSelectionSound, 0)
        XCTAssertEqual(viewModel.missedSelectionPosition, 0)
        
        XCTAssertFalse(viewModel.canUnlockNextLevel())
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
