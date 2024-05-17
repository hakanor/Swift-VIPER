//
//  DetailRouter.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

protocol DetailRouting {
    
}

class DetailRouter {
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension DetailRouter: DetailRouting {
    
}
