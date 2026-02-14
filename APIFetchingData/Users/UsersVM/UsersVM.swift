

// MARK: - Protocol
protocol UsersViewModelProtocol {
    func numberOfUsers() -> Int
    func Users(at index: Int) -> Users
    func getUsersDataFromServer() async
}


// MARK: - ViewModel
class UsersViewModel: UsersViewModelProtocol {
    
    // MARK: - Properties
    private var users: [Users] = []
    private var service: UsersNetworkManagerProtocol?
    
    
    // MARK: - Initializer
    init(service: UsersNetworkManagerProtocol? = nil) {
        self.service = service
    }
    
    
    // MARK: - API Call
    func getUsersDataFromServer() async {
        users = await service?.getUsersDataFromServer(url: Server.PostUrl.rawValue) ?? []
        print("checking this message")
    }
    
    
    // MARK: - Data Access    
    func numberOfUsers() -> Int {
        return users.count
    }
    
    func Users(at index: Int) -> Users {
        return users[index]
    }
}
