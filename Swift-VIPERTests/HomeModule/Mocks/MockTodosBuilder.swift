//
//  MockTodosBuilder.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 20.05.2024.
//

import Foundation
@testable import Swift_VIPER

enum MockTodosBuilder {
    
    static func createSingleTodo() -> [Todo] {
        return [
            Todo(userId: 1, id: 1, title: "Example Todo", completed: false)
        ]
    }
    
    static func createMultipleTodos() -> [Todo] {
        return [
            Todo(userId: 3, id: 1, title: "Todo 3", completed: false),
            Todo(userId: 2, id: 2, title: "Todo 2", completed: true),
            Todo(userId: 1, id: 3, title: "Todo 1", completed: false)
        ]
    }
}
