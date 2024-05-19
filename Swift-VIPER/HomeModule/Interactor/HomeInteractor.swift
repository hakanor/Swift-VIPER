//
//  HomeInteractor.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

protocol HomeUseCase {
    func getTodos() async throws -> [Todo]
    func sortTodos(_ todos: [Todo], by sortOption: TodoSortOption) -> [Todo]
}

class HomeInteractor {
    private var webService: WebServiceProtocol
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
}

extension HomeInteractor: HomeUseCase {
    func getTodos() async throws -> [Todo] {
        try await webService.fetchTodos()
    }
    
    func sortTodos(_ todos: [Todo], by sortOption: TodoSortOption) -> [Todo] {
        switch sortOption {
        case .alphabetical:
            var sortedTodos = todos
            sortedTodos.sort { $0.title < $1.title}
            return sortedTodos
        case .numerical:
            var sortedTodos = todos
            sortedTodos.sort { $0.id < $1.id}
            return sortedTodos
        }
    }
}
