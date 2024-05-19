//
//  HomePresenter.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

protocol HomePresentation {
    func viewDidLoad() -> Void
    func didSelectTodoItem(_ todo: Todo)
}

class HomePresenter {
    
    var interactor: HomeUseCase
    var router: HomeWireFrame
    weak var view: HomeView?
    var taskFactory: TaskFactoryProtocol
    
    init(interactor: HomeUseCase, router: HomeWireFrame, taskFactory: TaskFactoryProtocol = TaskFactory()) {
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
}
