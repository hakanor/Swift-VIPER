//
//  HomePresenter.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

protocol HomePresentation {
    func viewDidLoad() -> Void
    func didSelectTodoItem(_ todo: Todo)
    func sortTodos(_ todos:[Todo], by sortOption: TodoSortOption)
}

class HomePresenter {
    
    var interactor: HomeUseCase
    var router: HomeWireframe
    weak var view: HomeView?
    var taskFactory: TaskFactoryProtocol
    
    init(interactor: HomeUseCase, router: HomeWireframe, taskFactory: TaskFactoryProtocol = TaskFactory()) {
        self.interactor = interactor
        self.router = router
        self.taskFactory = taskFactory
    }
}

extension HomePresenter: HomePresentation {
    func viewDidLoad() {
        view?.showLoadingView()
//        Task {
//            do {
//                let todos = try await interactor.getTodos()
//                view?.updateTodoList(with: todos)
//                view?.dismissLoadingView()
//            } catch {
//                let alertModel = AlertModel(title: "Error", message: error.localizedDescription, accessibilityIdentifier: "errorAlertDialog")
//                view?.dismissLoadingView()
//                view?.showAlertDialog(with: alertModel)
//            }
//        }
        taskFactory.task() { [weak self] in
            guard let self else { return }
            do {
                let todos = try await interactor.getTodos()
                view?.updateTodoList(with: todos)
                view?.dismissLoadingView()
            } catch {
                let alertModel = AlertModel(title: "Error", message: error.localizedDescription, accessibilityIdentifier: "errorAlertDialog")
                view?.dismissLoadingView()
                view?.showAlertDialog(with: alertModel)
            }
        }
    }
    
    func didSelectTodoItem(_ todo: Todo) {
        router.navigateToDetail(with: todo)
    }
    
    func sortTodos(_ todos: [Todo], by sortOption: TodoSortOption) {
        let sortedTodos = interactor.sortTodos(todos, by: sortOption)
        view?.updateTodoList(with: sortedTodos)
    }
}
