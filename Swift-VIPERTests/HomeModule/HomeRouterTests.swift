//
//  HomeRouterTests.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 18.05.2024.
//

import XCTest
@testable import Swift_VIPER

final class HomeRouterTests: XCTestCase {
    
    var sut: HomeRouter!
    var viewController: UIViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewController = UIViewController()
        sut = HomeRouter(viewController: viewController)
    }

    override func tearDownWithError() throws {
        sut = nil
        viewController = nil
        try super.tearDownWithError()
    }
    
    // TODO: - Check again
    func test_NavigateToDetail_shouldSuccess() {
        // Arrange
        let todo = Todo(userId: 0, id: 0, title: "Title", completed: true)
        let vc = DetailModuleBuilder().build(with: todo)
        
        // Act
        sut.navigateToDetail(with: todo)
        
        // Assert
//        XCTAssertNotNil(sut.viewController?.presentedViewController)
//        XCTAssertEqual(lastController, vc)
//        XCTAssertEqual(lastController?.todo.title, todo.title)
//        XCTAssertNotNil(lastController?.presenter)
    }
}
