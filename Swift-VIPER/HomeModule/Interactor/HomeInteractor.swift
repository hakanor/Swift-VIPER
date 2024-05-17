//
//  HomeInteractor.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

protocol HomeUseCase {
    func getTodos() async throws -> [Todo]
}

class HomeInteractor {
    private var webService: WebServiceProtocol
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
}

extension HomeInteractor: HomeUseCase {
    func getTodos() async throws -> [Todo] {
        do {
            let todos = try await webService.fetchTodos()
            return todos
        } catch {
            throw error
        }
    }
}
