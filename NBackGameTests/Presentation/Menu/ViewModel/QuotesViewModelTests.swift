//
//  QuotesViewModelTests.swift
//  NBackGameTests
//
//  Created by Kornel Miszczak on 22/06/2022.
//

import XCTest

class QuotesViewModel {
    let quote: (author: String, content: String) = ("", "")
}

class QuotesViewModelTests: XCTestCase {

    func test_init_doesNotHaveAnyQuote() {
        let sut = QuotesViewModel()

        XCTAssertEqual(sut.quote.author, "")
        XCTAssertEqual(sut.quote.content, "")
    }
}
