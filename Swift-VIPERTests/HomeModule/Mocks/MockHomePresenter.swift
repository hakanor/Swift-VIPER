//
//  MockHomePresenter.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 20.05.2024.
//

import Foundation
@testable import Swift_VIPER

final class MockHomePresenter: HomePresentation {
    
    // MARK: - viewDidLaod
    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        viewDidLoadCallsCount > 0
    }
    func viewDidLoad() {
        viewDidLoadCallsCount += 1
    }
    
    // MARK: - didSelectTodoItem
    var didSelectTodoItemCallsCount = 0
    var didSelectTodoItemCalled: Bool {
        didSelectTodoItemCallsCount > 0
    }
    func didSelectTodoItem(_ todo: Swift_VIPER.Todo) {
        didSelectTodoItemCallsCount += 1
    }
    
    // MARK: - sortTodos
    var sortTodosCallsCount = 0
    var sortTodosCalled: Bool {
        sortTodosCallsCount > 0
    }
    func sortTodos(_ todos: [Swift_VIPER.Todo], by sortOption: Swift_VIPER.TodoSortOption) {
        sortTodosCallsCount += 1
    }
}
