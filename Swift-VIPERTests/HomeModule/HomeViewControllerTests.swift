//
//  HomeViewControllerTests.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 18.05.2024.
//

import XCTest
@testable import Swift_VIPER

final class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeModuleBuilder().build() as? HomeViewController
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_updateTableView() {
        // Arrange
        let todos = [Todo(userId: 0, id: 0, title: "Title", completed: true)]
        XCTAssertEqual(sut.todos.count, 0)
        
        // Act
        sut.updateTableView(with: todos)
        
        // Assert
        XCTAssertEqual(sut.todos.count, todos.count)
        XCTAssertEqual(sut.todos.first?.title, todos.first?.title)
    }
    
    func test_showAlertDialog() {
        // Arrange
        let alertModel = AlertModel(title: "Test Title", message: "Test Message", accessibilityIdentifier: "testAlert")
        
        // Act
        sut.showAlertDialog(with: alertModel)
        
        let presentedViewController = sut.presentedViewController as? UIAlertController
        
        // Assert
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(presentedViewController)
            XCTAssertEqual(presentedViewController?.title, alertModel.title)
            XCTAssertEqual(presentedViewController?.message, alertModel.message)
            XCTAssertEqual(presentedViewController?.view.accessibilityIdentifier, alertModel.accessibilityIdentifier)
            XCTAssertTrue(presentedViewController!.isBeingPresented)
        }
    }
    
    // TODO: - Check again
    func test_showLoadingView() {
        // Act
        sut.showLoadingView()
        
        let presentedViewController = sut.view.subviews.last as? LoadingViewController
        
        // Assert
        DispatchQueue.main.async {
            XCTAssertNotNil(presentedViewController)
        }
    }
    
    // TODO: - Check again
    func test_dismissLoadingView() {
        // Act
        sut.showLoadingView()
        
        let lastSubview = sut.view.subviews.last as? LoadingViewController
        
        // Assert
        DispatchQueue.main.async {
            XCTAssertNil(lastSubview)
        }
    }
    
    // TODO: - Check again
    func test_didSelectItemAt() {
        
    }
}
