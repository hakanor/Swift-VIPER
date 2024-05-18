//
//  MockHomeRouter.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 18.05.2024.
//

import Foundation
@testable import Swift_VIPER

class MockHomeRouter: HomeRouting {
    
    var navigateToDetailCallsCount = 0
    var navigateToDetailCalled: Bool {
        navigateToDetailCallsCount > 0
    }
    
    func navigateToDetail(with: Todo) {
       navigateToDetailCallsCount += 1
    }
}
