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
    var webService: WebServiceProtocol!
    
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
    
    func test_getTodos_shouldReturnSuccess() async {
        // Arrange
        let mockWebService = MockWebService()
        mockWebService.shouldReturnError = false
        
        // Act
        do {
            let todos = try await mockWebService.fetchTodos()
            // Assert
            XCTAssertTrue(mockWebService.fetchTodosCalled)
            XCTAssertEqual(todos.count, 1)
            XCTAssertEqual(todos.first?.title, "Test Todo")
        } catch {
            XCTFail()
        }
    }
    
    func test_getTodos_shouldReturnError() async {
        // Arrange
        let mockWebService = MockWebService()
        mockWebService.shouldReturnError = true
        let errorToReturn = NetworkError.failedRequest(error: "TestError")
        mockWebService.errorToReturn = errorToReturn
        
        // Act
        do {
            let _ = try await mockWebService.fetchTodos()
            XCTFail()
        } catch {
            // Assert
            XCTAssertTrue(mockWebService.fetchTodosCalled)
            XCTAssertEqual(error.localizedDescription, errorToReturn.localizedDescription)
        }
    }
}
