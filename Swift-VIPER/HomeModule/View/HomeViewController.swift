//
//  ViewController.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

protocol HomeView: AnyObject {
    func updateTableView(with todos: [Todo])
    func showAlertDialog(with alert: AlertModel)
}

class HomeViewController: UIViewController {
    
    var todos = [Todo]()
    var presenter: HomePresentation!
    
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
        presenter.viewDidLoad()
        configureUI()
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
    func updateTableView(with todos: [Todo]) {
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
