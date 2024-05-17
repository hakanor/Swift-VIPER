//
//  LoaderDisplayable.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 18.05.2024.
//

import UIKit

protocol LoaderDisplayable where Self: UIViewController {
    func showLoading()
    func dismissLoading()
}

extension LoaderDisplayable {
    func showLoading() {
        let child = LoadingViewController()
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    func dismissLoading() {
        guard let child = children.last as? LoadingViewController else { return }
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}

class LoadingViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        view.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            self.view.alpha = 0.5
        }

        let activityIndicator = UIActivityIndicatorView(style: .large)
        view.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
}
