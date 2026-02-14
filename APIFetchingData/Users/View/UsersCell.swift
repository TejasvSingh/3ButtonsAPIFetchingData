//
//  UsersCell.swift
//  ButtonFetchingData
//
//  Created by Tejasv Singh on 2/13/26.
//

import UIKit

// MARK: - Custom TableView Cell
class UsersVCTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    var titleLabel: UILabel?
    var descriptionLabel: UILabel?
    
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Setup
    func setUpUI() {
        // Configure titleLabel
        titleLabel = UILabel()
        titleLabel?.textColor = .blue
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel?.numberOfLines = 0
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel!)
        
        // Configure descriptionLabel
        descriptionLabel = UILabel()
        descriptionLabel?.textColor = .black
        descriptionLabel?.numberOfLines = 0
        descriptionLabel?.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel!)
        
        // Set constraints
        if let titleLabel = titleLabel, let descriptionLabel = descriptionLabel {
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
                descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
                descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            ])
        }
    }
    
    
    // MARK: - Data Binding
    func setData(user: Users) {
        titleLabel?.text = user.title ?? ""
        descriptionLabel?.text = user.body ?? ""
    }
}
