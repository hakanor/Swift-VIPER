//
//  HomeRouter.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

protocol HomeWireFrame {
    func navigateToDetail(with todo: Todo)
}

class HomeRouter {
    weak var viewController: UIViewController?
}

extension HomeRouter: HomeWireFrame {
    func navigateToDetail(with todo: Todo) {
        let vc = DetailModuleBuilder().build(with: todo)
        viewController?.present(vc, animated: true)
    }
}
