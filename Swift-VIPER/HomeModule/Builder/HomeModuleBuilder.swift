//
//  HomeModuleBuilder.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

class HomeModuleBuilder {
    func build() -> UIViewController {
        // create presenter's depend.
        let webService = WebService(networkProvider: NetworkProvider())
        let interactor = HomeInteractor(webService: webService)
        let router = HomeRouter()
        let presenter = HomePresenter(interactor: interactor, router: router)
        let view = HomeViewController(presenter: presenter)
        
        router.viewController = view
        presenter.view = view
        return view
    }
}
