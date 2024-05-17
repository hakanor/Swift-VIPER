//
//  DetailViewController.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

protocol DetailView: AnyObject {
    func displayTodoDetails()
}

class DetailViewController: UIViewController {
    
    var todo: Todo!
    var presenter: DetailPresentation!
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userIdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let completedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        // Title label
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        // User ID label
        view.addSubview(userIdLabel)
        NSLayoutConstraint.activate([
            userIdLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            userIdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userIdLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        // Completed label
        view.addSubview(completedLabel)
        NSLayoutConstraint.activate([
            completedLabel.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: 20),
            completedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            completedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        // Tap button
        view.addSubview(tapButton)
        NSLayoutConstraint.activate([
            tapButton.topAnchor.constraint(equalTo: completedLabel.bottomAnchor, constant: 40),
            tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Add action for the button
        tapButton.addTarget(self, action: #selector(tapButtonTapped), for: .touchUpInside)
    }

    @objc private func tapButtonTapped() {
        print("Tap button tapped!")
    }
}

extension DetailViewController: DetailView {
    func displayTodoDetails() {
        titleLabel.text = "Title: \(todo.title)"
        userIdLabel.text = "User ID: \(todo.userId)"
        completedLabel.text = "Completed: \(todo.completed ? "Yes" : "No")"
    }
}
