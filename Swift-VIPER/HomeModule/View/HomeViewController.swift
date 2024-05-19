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
    var context: Context
    
    init(presenter: HomePresentation, context: Context = UIContext()) {
        self.presenter = presenter
        self.context = context
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
        setupNavigationBar()
        setupCollectionView()
        presenter.viewDidLoad()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func setupNavigationBar() {
        let sortAlphabeticallyImage = UIImage(systemName: "textformat.abc")
        let sortNumericallyImage = UIImage(systemName: "arrow.up.arrow.down")
        
        let alphabeticallySortButton = createBarButtonItem(image: sortAlphabeticallyImage, action: #selector(sortAlphabeticallyTapped))
        let numericSortButton = createBarButtonItem(image: sortNumericallyImage, action: #selector(sortNumericallyTapped))
        
        navigationItem.rightBarButtonItems = [numericSortButton, alphabeticallySortButton]
        
        title = "Todos"
        navigationController?.navigationBar.tintColor = UIColor(red: 59/255, green: 65/255, blue: 60/255, alpha: 1)
    }
    
    private func createBarButtonItem(image: UIImage?, action: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .roundedRect)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.reuseIdentifier)
    }
    
    @objc private func sortAlphabeticallyTapped() {
        presenter.sortTodos(todos, by: .alphabetical)
    }

    @objc private func sortNumericallyTapped() {
        presenter.sortTodos(todos, by: .numerical)
    }
}

extension HomeViewController: HomeView {
    func updateTodoList(with todos: [Todo]) {
        self.todos = todos
        context.run {
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
        context.run {
            self.showLoading()
        }
    }
    
    func dismissLoadingView() {
        context.run {
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
