//
//  DetailModuleBuilder.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

class DetailModuleBuilder {
    func build(with todo: Todo) -> UIViewController {
        
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(interactor: interactor, router: router)
        let view = DetailViewController(todo: todo, presenter: presenter)
        
        router.viewController = view
        presenter.view = view
        return view
    }
}
