//
//  SerialContext.swift
//  Swift-VIPERTests
//
//  Created by Hakan Or on 19.05.2024.
//

import Foundation
@testable import Swift_VIPER

final class SerialContext: Context {
    func run(closure: @escaping () -> (Void)) {
        closure()
    }
}
