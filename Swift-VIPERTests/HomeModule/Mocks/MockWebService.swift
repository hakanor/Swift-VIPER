//
//  MockWebService.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 18.05.2024.
//

import Foundation
@testable import Swift_VIPER

class MockWebService: WebServiceProtocol {
    
    var shouldReturnError = false
    var errorToReturn: Error = NetworkError.decodingError
    
    var fetchTodosCallsCount = 0
    var fetchTodosCalled: Bool {
        fetchTodosCallsCount > 0
    }
    
    func fetchTodos() async throws -> [Swift_VIPER.Todo] {
        fetchTodosCallsCount += 1
        if shouldReturnError {
            throw errorToReturn
        } else {
            return MockTodosBuilder.createMultipleTodos()
        }
    }
}
