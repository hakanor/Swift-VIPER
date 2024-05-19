//
//  HomeInteractorTests.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 18.05.2024.
//

import XCTest
@testable import Swift_VIPER

final class HomeInteractorTests: XCTestCase {
    
    var sut: HomeInteractor!
    var webService: MockWebService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        webService = MockWebService()
        sut = HomeInteractor(webService: webService)
    }
    
    override func tearDownWithError() throws {
        webService = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_getTodos_shouldReturnSuccess() async throws {
        // Arrange
        webService.shouldReturnError = false
        
        // Act
        let todos = try await sut.getTodos()
        // Assert
        XCTAssertTrue(webService.fetchTodosCalled)
        XCTAssertEqual(todos.count, 1)
        XCTAssertEqual(todos.first?.title, "Test Todo")
    }
    
    func test_getTodos_shouldReturnError() async {
        // Arrange
        webService.shouldReturnError = true
        let errorToReturn = NetworkError.failedRequest(error: "TestError")
        webService.errorToReturn = errorToReturn
        
        // Act
        do {
            _ = try await sut.getTodos()
            XCTFail()
        } catch {
            // Assert
            XCTAssertTrue(webService.fetchTodosCalled)
            XCTAssertEqual(error.localizedDescription, errorToReturn.localizedDescription)
        }
    }
}
