import UIKit

// MARK: - People View Controller
class PeopleVC: UIViewController, UITableViewDataSource {
    
    // MARK: - UI Components
    var peopleTableView: UITableView?
    var titleLabel: UILabel?
    let toggleSwitch : UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        return toggleSwitch
    }()
    
    // MARK: - Properties
    var viewModel: PeopleViewModelProtocol?
    
    
    // MARK: - Initializers
    init(viewModel: PeopleViewModelProtocol?) {
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
        
        // Fetch people data asynchronously
        Task {
            await viewModel?.getPeopleDataFromServer()
            print("data fetched successfully")
            peopleTableView?.reloadData()
        }
    }
    
    
    // MARK: - Setup UI
    func setupUI() {
        // Title Label
        titleLabel = UILabel()
        titleLabel?.text = "PEOPLE"
        titleLabel?.textColor = .white
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        // Table View
        peopleTableView = UITableView()
        peopleTableView?.dataSource = self
        peopleTableView?.translatesAutoresizingMaskIntoConstraints = false
        peopleTableView?.register(PeopleVCTableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        peopleTableView?.rowHeight = UITableView.automaticDimension
        peopleTableView?.estimatedRowHeight = 300
        
        // Add to view and setup constraints
        if let peopleTableView = peopleTableView, let titleLabel = titleLabel {
            view.addSubview(titleLabel)
            view.addSubview(peopleTableView)
            view.addSubview(toggleSwitch)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                toggleSwitch.topAnchor.constraint(equalTo: titleLabel.topAnchor),
                toggleSwitch.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -56),
                
                peopleTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                peopleTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                peopleTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                peopleTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        }
       
    }
    
    @objc func switchChanged(_ sender: UISwitch){
        let service : UsersNetworkManagerProtocol = sender.isOn ? UsersNetworkManager() : MockNetworkManager()
        viewModel = PeopleViewModel(service: service)
        Task {
            await viewModel?.getPeopleDataFromServer()
            print("data fetched successfully")
            peopleTableView?.reloadData()
        }
    }
    
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfPeople() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? PeopleVCTableViewCell
        
        if let user = viewModel?.People(at: indexPath.row) {
            homeCell?.setData(user: user)
        }
        
        return homeCell!
    }
}
