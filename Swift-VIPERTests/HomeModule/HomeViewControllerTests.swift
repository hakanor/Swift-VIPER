//
//  HomeViewControllerTests.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 19.05.2024.
//

import XCTest
import SnapshotTesting
@testable import Swift_VIPER

final class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController!
    var context: SerialContext!
    var presenter: MockHomePresenter!
    var todos: [Todo]!

    override func setUpWithError() throws {
        try super.setUpWithError()
        presenter = MockHomePresenter()
        context = SerialContext()
        todos = MockTodosBuilder.createMultipleTodos()
        sut = HomeViewController(presenter: presenter, context: context)
    }

    func test_HomeViewController_initialState() {
        // When
        context.run {
            self.sut.updateTodoList(with: self.todos)
        }
        
        // Then
        assertSnapshot(
            matching: sut,
            as: .image,
            testName: "test_HomeViewController_initialState"
        )
        
    }
    
    func test_HomeViewController_numericalSortedState() {
        // Given
        let sortedTodos = HomeInteractor(webService: MockWebService()).sortTodos(todos, by: .numerical)
        
        // When
        context.run {
            self.sut.updateTodoList(with: sortedTodos)
        }
        
        // Then
        assertSnapshot(
            matching: sut,
            as: .image,
            testName: "test_HomeViewController_numericalSortedState"
        )
    }
    
    func test_HomeViewController_alphabeticalSortedState() {
        // Given
        let sortedTodos = HomeInteractor(webService: MockWebService()).sortTodos(todos, by: .alphabetical)
        
        // When
        context.run {
            self.sut.updateTodoList(with: sortedTodos)
        }
        
        // Then
        assertSnapshot(
            matching: sut,
            as: .image,
            testName: "test_HomeViewController_alphabeticalSortedState"
        )
    }
}
