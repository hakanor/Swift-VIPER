//
//  MockHomeView.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 18.05.2024.
//

import Foundation
@testable import Swift_VIPER
import XCTest

class MockHomeView: HomeView {

    // MARK: - updateTodoList
    var updateTodoListCallsCount = 0
    var updateTableViewCalled: Bool {
        updateTodoListCallsCount > 0
    }
    func updateTodoList(with todos: [Swift_VIPER.Todo]) {
        updateTodoListCallsCount += 1
    }
    
    // MARK: - showAlertDialog
    var showAlertDialogCallsCount = 0
    var showAlertDialogCalled: Bool {
        showAlertDialogCallsCount > 0
    }
    func showAlertDialog(with alert: Swift_VIPER.AlertModel) {
        showAlertDialogCallsCount += 1
        
    }
    
    // MARK: - showLoadingView
    var showLoadingViewCallsCount = 0
    var showLoadingViewCalled: Bool {
        showLoadingViewCallsCount > 0
    }
    func showLoadingView() {
        showLoadingViewCallsCount += 1
    }
    
    // MARK: - dismissLoadingView
    var dismissLoadingViewCallsCount = 0
    var dismissLoadingViewCalled: Bool {
        dismissLoadingViewCallsCount > 0
    }
    var dismissLoadingViewExpectation: XCTestExpectation?
    func dismissLoadingView() {
        dismissLoadingViewCallsCount += 1
        dismissLoadingViewExpectation?.fulfill()
    }
}
