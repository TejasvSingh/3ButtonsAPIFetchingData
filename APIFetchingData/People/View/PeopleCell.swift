//
//  PeopleCell.swift
//  ButtonFetchingData
//
//  Created by Tejasv Singh on 2/13/26.
//

import UIKit

// MARK: - Custom TableView Cell
class PeopleVCTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    var nameLabel: UILabel?
    var usernameLabel: UILabel?
    
    
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
        // Configure nameLabel
        nameLabel = UILabel()
        nameLabel?.textColor = .blue
        nameLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel?.numberOfLines = 0
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel!)
        
        // Configure usernameLabel
        usernameLabel = UILabel()
        usernameLabel?.textColor = .black
        usernameLabel?.numberOfLines = 0
        usernameLabel?.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(usernameLabel!)
        
        // Set constraints
        if let nameLabel = nameLabel, let usernameLabel = usernameLabel {
            NSLayoutConstraint.activate([
                nameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
                nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                
                usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 25),
                usernameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                usernameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
                usernameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            ])
        }
    }
    
    
    // MARK: - Data Binding
    func setData(user: People) {
        nameLabel?.text = user.name ?? ""
        usernameLabel?.text = user.username ?? ""
    }
}
