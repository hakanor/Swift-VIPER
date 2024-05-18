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

    override func setUpWithError() throws {
        try super.setUpWithError()
        interactor = MockHomeInteractor()
        router = MockHomeRouter()
        view = MockHomeView()
        sut = HomePresenter(interactor: interactor, router: router, view: view)
    }

    override func tearDownWithError() throws {
        interactor = nil
        router = nil
        view = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_viewDidLoad_SuccessfulFlow() {
        // Arrange
        interactor.todos = [Todo(userId: 0, id: 0, title: "Test", completed: true)]
        let expectation = expectation(description: "Wait for request")
        
        // Act
        sut.viewDidLoad()
        
        // Assert
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertTrue(self.view.showLoadingViewCalled)
            XCTAssertTrue(self.view.updateTableViewCalled)
            XCTAssertTrue(self.view.dismissLoadingViewCalled)
            XCTAssertFalse(self.view.showAlertDialogCalled)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
    
    func test_viewDidLoad_ErrorFlow() {
        // Arrange
        interactor.error = .invalidResponse
        let expectation = expectation(description: "Wait for request")
        
        // Act
        sut.viewDidLoad()
        
        // Assert
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertTrue(self.view.showLoadingViewCalled)
            XCTAssertFalse(self.view.updateTableViewCalled)
            XCTAssertTrue(self.view.dismissLoadingViewCalled)
            XCTAssertTrue(self.view.showAlertDialogCalled)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
    
    func test_didSelectTodoItem() {
        // Arrange
        let todo = Todo(userId: 0, id: 0, title: "", completed: true)
        
        // Act
        sut.didSelectTodoItem(todo)
        
        // Arrange
        XCTAssertTrue(router.navigateToDetailCalled)
    }
}
