//
//  MockHomeView.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 18.05.2024.
//

import Foundation
@testable import Swift_VIPER

class MockHomeView: HomeView {
    
    var updateTableViewCallsCount = 0
    var showAlertDialogCallsCount = 0
    var showLoadingViewCallsCount = 0
    var dismissLoadingViewCallsCount = 0
    
    var updateTableViewCalled: Bool {
        updateTableViewCallsCount > 0
    }
    
    var showAlertDialogCalled: Bool {
        showAlertDialogCallsCount > 0
    }
    
    var showLoadingViewCalled: Bool {
        showLoadingViewCallsCount > 0
    }
    
    var dismissLoadingViewCalled: Bool {
        dismissLoadingViewCallsCount > 0
    }
    
    func updateTableView(with todos: [Swift_VIPER.Todo]) {
        updateTableViewCallsCount += 1
    }
    
    func showAlertDialog(with alert: Swift_VIPER.AlertModel) {
        showAlertDialogCallsCount += 1
        
    }
    
    func showLoadingView() {
        showLoadingViewCallsCount += 1
    }
    
    func dismissLoadingView() {
        dismissLoadingViewCallsCount += 1
    }
}
