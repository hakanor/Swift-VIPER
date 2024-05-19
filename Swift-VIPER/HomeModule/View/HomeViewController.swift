//
//  ViewController.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

protocol HomeView: AnyObject {
    func updateTodoList(with todos: [Todo])
    func showAlertDialog(with alert: AlertModel)
    func showLoadingView()
    func dismissLoadingView()
}

class HomeViewController: UIViewController, LoaderDisplayable {
    
    var todos = [Todo]()
    var presenter: HomePresentation
    
    init(presenter: HomePresentation) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter.viewDidLoad()
        setupCollectionView()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.reuseIdentifier)
    }
}

extension HomeViewController: HomeView {
    func updateTodoList(with todos: [Todo]) {
        self.todos = todos
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showAlertDialog(with alert: AlertModel) {
        let alertDialog = UIAlertController(title: alert.title, message: alert.message, preferredStyle: .alert)
        alertDialog.addAction(UIAlertAction(title: "OK", style: .cancel))
        
        DispatchQueue.main.async {
            alertDialog.view.accessibilityIdentifier = alert.accessibilityIdentifier
            self.present(alertDialog, animated: true)
        }
    }
    
    func showLoadingView() {
        DispatchQueue.main.async {
            self.showLoading()
        }
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.dismissLoading()
        }
        UIContext().run {
            self.dismissLoading()
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.reuseIdentifier, for: indexPath) as! HomeCell
        let todo = todos[indexPath.item]
        cell.configure(with: todo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let todo = todos[indexPath.item]
        presenter.didSelectTodoItem(todo)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 20, height: 60)
    }
}

protocol Context {
    func run(closure: @escaping () -> (Void))
}

final class UIContext: Context {
    func run(closure: @escaping () -> (Void)) {
        DispatchQueue.main.async {
            closure()
        }
    }
}

final class SerialContext: Context {
    func run(closure: @escaping () -> (Void)) {
        closure()
    }
}
