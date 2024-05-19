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
    var error: NetworkError?
    
    var getTodosCallsCount = 0
    var getTodosCalled: Bool {
        getTodosCallsCount > 0
    }
    
    func getTodos() async throws -> [Todo] {
        getTodosCallsCount += 1
        if let error = error {
            throw error
        } else {
            return todos
        }
    }
}
