//
//  HomeCell.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

class HomeCell: UICollectionViewCell {
    static let reuseIdentifier = "HomeCell"
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        
        contentView.layer.cornerRadius = 8
        
        contentView.backgroundColor = UIColor(red: 157/255, green: 181/255, blue: 178/255, alpha: 1)
    }
    
    func configure(with todo: Todo) {
        titleLabel.text = todo.title
        
        let imageName = todo.completed ? "checkmark.circle.fill" : "xmark.circle.fill"
        imageView.image = UIImage(systemName: imageName)
        imageView.tintColor = UIColor(red: 59/255, green: 65/255, blue: 60/255, alpha: 1)
    }
}
