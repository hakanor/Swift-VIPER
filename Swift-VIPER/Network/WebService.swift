//
//  WebService.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import Foundation

protocol WebServiceProtocol {
    func fetchTodos() async throws -> [Todo]
}

final class WebService: WebServiceProtocol {

    private var networkProvider: NetworkProvidable
    private var urlString = "https://jsonplaceholder.typicode.com/todos"
    
    init(networkProvider: NetworkProvidable) {
        self.networkProvider = networkProvider
    }
    
    func fetchTodos() async throws -> [Todo] {
        do {
            let todoData = try await networkProvider.fetch(urlString: urlString, httpMethod: .get)
            let todos = try networkProvider.decode([Todo].self, from: todoData)
            return todos
        } catch {
            throw error
        }
    }
}
