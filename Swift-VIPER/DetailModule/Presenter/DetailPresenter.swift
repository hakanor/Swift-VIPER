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
    
    init(interactor: DetailUseCase, router: DetailRouting) {
        self.interactor = interactor
        self.router = router
    }
    
}

extension DetailPresenter: DetailPresentation {
    func viewDidLoad() {
        view?.displayTodoDetails()
    }
}
