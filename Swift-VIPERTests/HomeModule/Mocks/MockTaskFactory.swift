//
//  MockTaskFactory.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 19.05.2024.
//

import Foundation
@testable import Swift_VIPER

final class MockTaskFactory: TaskFactoryProtocol {

    var operations: [() async -> Sendable] = []
    func task<Success>(priority: TaskPriority?, operation: @escaping @Sendable () async -> Success) {
        operations.append(operation)
    }

    func wait() async {
        for operation in operations {
            _ = await operation()
        }
    }
}
