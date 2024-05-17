//
//  HomePresenter.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

protocol HomePresentation {
    func viewDidLoad() -> Void
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
        let homeModel = interactor.getTitle()
        view?.updateModel(homeModel: homeModel)
    }
}
