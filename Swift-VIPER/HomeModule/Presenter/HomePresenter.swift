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
    var router: HomeRouting
    weak var view: HomeView?
    
    init(interactor: HomeUseCase, router: HomeRouting, view: HomeView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
}

extension HomePresenter: HomePresentation {
    func viewDidLoad() {
        view?.showLoadingView()
        Task {
            do {
                let todos = try await interactor.getTodos()
                view?.updateTableView(with: todos)
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
