//
//  DetailPresenter.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import Foundation

protocol DetailPresentation {
    func viewDidLoad() -> Void
}

class DetailPresenter {
    
    var interactor: DetailUseCase
    var router: DetailRouting
    weak var view: DetailView?
    
    init(interactor: DetailUseCase, router: DetailRouting, view: DetailView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}

extension DetailPresenter: DetailPresentation {
    func viewDidLoad() {
        view?.displayTodoDetails()
    }
}
