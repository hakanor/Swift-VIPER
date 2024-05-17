//
//  HomeRouter.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

// protocol HomeWireFrame -> better naming?
protocol HomeRouting {
    func navigateToDetail(with todo: Todo)
}

class HomeRouter {
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouting {
    func navigateToDetail(with todo: Todo) {
        let vc = DetailModuleBuilder().build(with: todo)
        viewController.present(vc, animated: true)
    }
}
