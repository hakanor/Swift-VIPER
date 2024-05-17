//
//  HomeModuleBuilder.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

class HomeModuleBuilder {
    func build() -> UIViewController {
        let view = HomeViewController()
        
        // create presenter's depend.
        let interactor = HomeInteractor()
        let router = HomeRouter(viewController: view)
        
        let presenter = HomePresenter(interactor: interactor, router: router, view: view)
        
        view.presenter = presenter
        return view
    }
}
