//
//  DetailModuleBuilder.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

class DetailModuleBuilder {
    func build(with todo: Todo) -> UIViewController {
        let view = DetailViewController()
        view.todo = todo
        
        let interactor = DetailInteractor()
        let router = DetailRouter(viewController: view)
        let presenter = DetailPresenter(interactor: interactor, router: router, view: view)
        
        view.presenter = presenter
        return view
    }
}
