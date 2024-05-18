//
//  HomeModuleBuilderTests.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 18.05.2024.
//

import XCTest
@testable import Swift_VIPER

final class HomeModuleBuilderTests: XCTestCase {
    
    var sut: HomeModuleBuilder!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeModuleBuilder()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_HomeModuleBuilder_shouldReturnViewController() {
        // Act
        let vc = sut.build() as? HomeViewController
        
        // Assert
        XCTAssertNotNil(vc)
        XCTAssertNotNil(vc!.presenter)
        XCTAssertEqual(vc!.todos.count, 0)
    }
}
