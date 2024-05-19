//
//  Context.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 19.05.2024.
//

import Foundation

protocol Context {
    func run(closure: @escaping () -> (Void))
}

final class UIContext: Context {
    func run(closure: @escaping () -> (Void)) {
        DispatchQueue.main.async {
            closure()
        }
    }
}
