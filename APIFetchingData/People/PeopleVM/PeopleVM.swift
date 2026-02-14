// MARK: - Protocol
protocol PeopleViewModelProtocol {
    func getPeopleDataFromServer() async
    func numberOfPeople() -> Int
    func People(at index: Int) -> People
}


// MARK: - ViewModel
class PeopleViewModel: PeopleViewModelProtocol {
    
    // MARK: - Properties
    var service: UsersNetworkManagerProtocol?
    var people: [People] = []
    
    
    // MARK: - Initializer
    init(service: UsersNetworkManagerProtocol? = nil) {
        self.service = service
    }
    
    
    // MARK: - API Call
    func getPeopleDataFromServer() async {
        people = await service?.getPeopleDataFromServer(url: Server.peopleUrl.rawValue) ?? []
        print("checking this message")
    }
    
    
    // MARK: - Data Access
    func numberOfPeople() -> Int {
        return people.count
    }
    
    func People(at index: Int) -> People {
        return people[index]
    }
}
