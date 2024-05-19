//
//  TaskFactory.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 19.05.2024.
//

import Foundation

protocol TaskFactoryProtocol {
    func task<Success>(priority: TaskPriority?, operation: @Sendable @escaping () async -> Success)
}

extension TaskFactoryProtocol {
    func task<Success>(operation: @Sendable @escaping () async -> Success){
        task(priority: nil, operation: operation)
    }
}

final class TaskFactory: TaskFactoryProtocol {
    func task<Success>(priority: TaskPriority? = nil, operation: @Sendable @escaping () async -> Success){
        Task(priority: priority, operation: operation)
    }
}
