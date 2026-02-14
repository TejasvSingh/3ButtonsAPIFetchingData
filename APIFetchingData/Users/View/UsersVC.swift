//
//  usersView.swift
//  ButtonFetchingData
//
//  Created by Tejasv Singh on 2/13/26.
//
import UIKit
// MARK: - Users View Controller
class UsersView: UIViewController, UITableViewDataSource {
    
    // MARK: - UI Components
    var userTableView: UITableView?
    var titleLabel: UILabel?
    
    // MARK: - Properties
    var viewModel: UsersViewModelProtocol?
    
    
    // MARK: - Initializers
    init(viewModel: UsersViewModelProtocol?) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Fetch users data asynchronously
        Task {
            await viewModel?.getUsersDataFromServer()
            print("data fetched successfully")
            userTableView?.reloadData()
        }
    }
    
    
    // MARK: - Setup UI
    func setupUI() {
        // Title Label
        titleLabel = UILabel()
        titleLabel?.text = "USERS"
        titleLabel?.textColor = .white
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        // Table View
        userTableView = UITableView()
        userTableView?.dataSource = self
        userTableView?.translatesAutoresizingMaskIntoConstraints = false
        userTableView?.register(UsersVCTableViewCell.self, forCellReuseIdentifier: "homeTableViewCell")
        userTableView?.rowHeight = UITableView.automaticDimension
        userTableView?.estimatedRowHeight = 300
        
        // Add to view and setup constraints
        if let userTableView = userTableView, let titleLabel = titleLabel {
            view.addSubview(titleLabel)
            view.addSubview(userTableView)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                userTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                userTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                userTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                userTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        }
    }
    
    
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfUsers() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath) as? UsersVCTableViewCell
        
        if let user = viewModel?.Users(at: indexPath.row) {
            homeCell?.setData(user: user)
        }
        
        return homeCell!
    }
}
