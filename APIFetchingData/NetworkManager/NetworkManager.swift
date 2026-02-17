import Foundation

// MARK: - Protocol
protocol UsersNetworkManagerProtocol {
    func getUsersDataFromServer(url: String) async -> [Users]
    func getCurrencyDataFromServer(url: String) async -> CryptoModel?
    func getPeopleDataFromServer(url: String) async -> [People]
}


// MARK: - Network Manager
class UsersNetworkManager: UsersNetworkManagerProtocol {
    
    // MARK: - Users API
    func getUsersDataFromServer(url: String) async -> [Users] {
        
        guard let serverURL = URL(string: url) else {
            print("Log: Invalid URL")
            return []
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: serverURL)
            
            if let serverResponse = response as? HTTPURLResponse, serverResponse.statusCode != 200 {
                print("Log: No data received from server")
                return []
            }
            
            let postList = try? JSONDecoder().decode([Users].self, from: data)
            return postList ?? []
            
        } catch {
            print("Log: Error fetching data from server")
            return []
        }
    }
    
    
    // MARK: - Crypto API
    func getCurrencyDataFromServer(url: String) async -> CryptoModel? {
        
        guard let serverURL = URL(string: url) else {
            print("Log: Invalid URL")
            return nil
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: serverURL)
            
            if let serverResponse = response as? HTTPURLResponse, serverResponse.statusCode != 200 {
                print("Log: No data received from server 9 \(serverResponse)")
                return nil
            }
            
            let postList = try? JSONDecoder().decode(CryptoModel.self, from: data)
            return postList
            
        } catch {
            print("Log: Error fetching data from server")
            return nil
        }
    }
    
    
    // MARK: - People API
    func getPeopleDataFromServer(url: String) async -> [People] {
        
        guard let serverURL = URL(string: url) else {
            print("Log: Invalid URL")
            return []
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: serverURL)
            
            if let serverResponse = response as? HTTPURLResponse, serverResponse.statusCode != 200 {
                print("Log: No data received from server")
                return []
            }
            
            let postList = try? JSONDecoder().decode([People].self, from: data)
            return postList ?? []
            
        } catch {
            print("Log: Error fetching data from server")
            return []
        }
    }
}
