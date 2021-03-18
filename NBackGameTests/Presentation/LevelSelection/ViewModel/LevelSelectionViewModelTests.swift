//
//  LevelSelectionViewModelTests.swift
//  NBackGameTests
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import XCTest
@testable import NBackGame

class LevelSelectionViewModelTests: XCTestCase {

    func test_whenUnlockedLevelSelected_thenStartPlay() throws {
        // given
        let actions = LevelSelectionViewModelActionsMock(expectation: self.expectation(description: "Action executed"))
        let useCase = FetchHighestUnlockedLevelUseCaseMock()

        let useCases = LevelSelectionViewModelUseCases(fetchHighestUnlockedLevelUseCase: useCase)
        let sut = LevelSelectionViewModel(actions: actions, useCases: useCases)
        // when
        sut.onAppear()
        sut.selectLevel(0)
        
        waitForExpectations(timeout: 2, handler: nil)
        // then
        XCTAssertTrue(true)
    }
    
    func test_whenLockedLevelSelected_thenDontStartPlay() throws {
        // given
        let actions = LevelSelectionViewModelActionsMock(expectation: nil)
        let useCase = FetchHighestUnlockedLevelUseCaseMock()

        let useCases = LevelSelectionViewModelUseCases(fetchHighestUnlockedLevelUseCase: useCase)
        let sut = LevelSelectionViewModel(actions: actions, useCases: useCases)
        // when
        sut.onAppear()
        
        // then
        XCTAssertEqual(sut.unlockedLevels, LevelSelectionViewModel.defaultLevelUnlocked)
    }
    
   
    // MARK: - Helper
    
    func selectLevel(_ level: Int) {
        
    }
    
    struct FetchHighestUnlockedLevelUseCaseMock: FetchHighestUnlockedLevelUseCase {
        func execute(fallbackLevel: Int, completion: @escaping (Int) -> Void) {
            completion(fallbackLevel)
        }
    }
    
    struct LevelSelectionViewModelActionsMock: LevelSelectionViewModelActions {
        var expectation: XCTestExpectation?

        var selectLevel: (Int) -> Void
    
        init(expectation: XCTestExpectation?) {
            self.expectation = expectation
            selectLevel = { _ in }
            selectLevel = selectLevelMock
        }
        
        
        func selectLevelMock(_ level: Int) {
            print("sleect mock")
            expectation?.fulfill()
        }
    }
}
