//
//  ViewController.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

protocol HomeView: AnyObject {
    func updateModel(homeModel: HomeModel)
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink.withAlphaComponent(0.5)
        presenter.viewDidLoad()
    }
    
}

extension HomeViewController: HomeView {
    func updateModel(homeModel: HomeModel) {
        // updateModel array etc
        self.title = homeModel.title
    }
}
