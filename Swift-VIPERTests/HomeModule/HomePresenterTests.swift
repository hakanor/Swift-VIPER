//
//  HomePresenterTests.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 18.05.2024.
//

import XCTest
@testable import Swift_VIPER

final class HomePresenterTests: XCTestCase {
    
    var sut: HomePresenter!
    var interactor: MockHomeInteractor!
    var router: MockHomeRouter!
    var view: MockHomeView!
    var taskFactory: MockTaskFactory!

    override func setUpWithError() throws {
        try super.setUpWithError()
        interactor = MockHomeInteractor()
        router = MockHomeRouter()
        taskFactory = MockTaskFactory()
        view = MockHomeView()
        sut = HomePresenter(interactor: interactor, router: router)
        sut.view = view
        sut.taskFactory = taskFactory
    }

    override func tearDownWithError() throws {
        interactor = nil
        router = nil
        view = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_viewDidLoad_SuccessfulFlow() async {
        // Arrange
        interactor.todos = [Todo(userId: 0, id: 0, title: "Test", completed: true)]
        // Act
        sut.viewDidLoad()
//        let dismissLoadingViewExpectation = expectation(description: "")
//        view.dismissLoadingViewExpectation = dismissLoadingViewExpectation
//        wait(for: [dismissLoadingViewExpectation], timeout: 5)
        await taskFactory.wait()
        
        // Assert
        XCTAssertTrue(view.showLoadingViewCalled)
        
        XCTAssertTrue(self.interactor.getTodosCalled)
        XCTAssertTrue(self.view.updateTodoListCalled)
        XCTAssertTrue(self.view.dismissLoadingViewCalled)
    }
    
    func test_viewDidLoad_ErrorFlow() async {
        // Arrange
        interactor.getTodosError = .failedRequest(error: "TestError")
        
        // Act
        sut.viewDidLoad()
        
        // wait for tasks to complete.
        await taskFactory.wait()
        
        // Assert
        XCTAssertTrue(view.showLoadingViewCalled)
        XCTAssertTrue(interactor.getTodosCalled)
        XCTAssertFalse(view.updateTodoListCalled)
        XCTAssertTrue(view.showAlertDialogCalled)
        XCTAssertTrue(view.dismissLoadingViewCalled)
    }
    
    func test_sortTodos() {
        // Arrange
        let todos = [
            Todo(userId: 2, id: 2, title: "ATodo", completed: false),
            Todo(userId: 1, id: 1, title: "ZTodo", completed: true),
        ]
        
        // Act
        sut.sortTodos(todos, by: .alphabetical)
        
        // Assert
        XCTAssertTrue(interactor.sortTodosCalled)
        XCTAssertTrue(view.updateTodoListCalled)
    }
}
