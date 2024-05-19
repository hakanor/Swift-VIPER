//
//  MockHomeInteractor.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 19.05.2024.
//

import Foundation
import XCTest
@testable import Swift_VIPER

class MockHomeInteractor: HomeUseCase {
    
    var todos: [Todo]!
    var getTodosError: NetworkError?
    
    // MARK: - getTodos
    var getTodosCallsCount = 0
    var getTodosCalled: Bool {
        getTodosCallsCount > 0
    }
    
    func getTodos() async throws -> [Todo] {
        getTodosCallsCount += 1
        if let error = getTodosError {
            throw error
        } else {
            return todos
        }
    }
    
    // MARK: - sortTodos
    var sortTodosCallsCount = 0
    var sortTodosCalled: Bool {
        sortTodosCallsCount > 0
    }
    func sortTodos(_ todos: [Swift_VIPER.Todo], by sortOption: Swift_VIPER.TodoSortOption) -> [Swift_VIPER.Todo] {
        sortTodosCallsCount += 1
        return todos
    }
}
