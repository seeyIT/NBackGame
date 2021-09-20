//
//  FetchHighestUnlockedLevelUseCaseTests.swift
//  NBackGameTests
//
//  Created by Kornel Miszczak on 17/03/2021.
//

import XCTest
@testable import NBackGame

class FetchHighestUnlockedLevelUseCaseTests: XCTestCase {

    func test_whenNoLevelUnlocked_thenUseFallback() {
        // given
        let expectation = self.expectation(description: "Level fetched")
        var unlockedLevel: Int = -1
        let fallbackLevel = 1
        let gameRepository = GameRepositoryMock()
        let sut = DefaultGetHighestUnlockedLevelUseCase(gameRepository: gameRepository)
        
        // when
        sut.execute(fallbackLevel: fallbackLevel) { result in
            unlockedLevel = result
            expectation.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 3.0, handler: nil)
        
        XCTAssertEqual(unlockedLevel, fallbackLevel)
    }
    
    func test_whenNoLevelUnlocked_thenUseFallback2() {
        // given
        let expectation = self.expectation(description: "Level fetched")
        var unlockedLevel: Int = -1
        let fallbackLevel = 2
        let gameRepository = GameRepositoryMock()
        let sut = DefaultGetHighestUnlockedLevelUseCase(gameRepository: gameRepository)
        
        // when
        sut.execute(fallbackLevel: fallbackLevel) { result in
            unlockedLevel = result
            expectation.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 3.0, handler: nil)
        
        XCTAssertEqual(unlockedLevel, fallbackLevel)
    }
    
    // MARK: Helpers
    
    class GameRepositoryMock: GameRepository {
        func fetchHighestUnlockedLevel(fallbackLevel: Int, completion: @escaping (Int) -> Void) {
            completion(fallbackLevel)
        }
        
        func saveUnlocked(level: Int, completion: @escaping (Result<Int, Error>) -> Void) { }
    }
    
}
