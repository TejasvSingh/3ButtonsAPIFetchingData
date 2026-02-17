//
//  MockNetworkManager.swift
//  APIFetching
//
//  Created by Tejasv Singh on 2/17/26.
//

import Foundation

// MARK: - Network Manager
class MockNetworkManager: UsersNetworkManagerProtocol {
    
    // MARK: - Users API
    func getUsersDataFromServer(url: String) async -> [Users] {
        
        let mockUsers: [Users] = [
                Users(userId: 1, id: 101, title: "First Post", body: "This is the first post body."),
                Users(userId: 2, id: 102, title: "Second Post", body: "This is the second post body."),
                Users(userId: 3, id: 103, title: "Third Post", body: "This is the third post body.")
            ]
        return mockUsers
    }
    
    
    // MARK: - Crypto API
    func getCurrencyDataFromServer(url: String) async -> CryptoModel? {
        
        let mockCrypto: CryptoModel = CryptoModel(
                bitcoin: Currency(usd: 28975.34),
                ethereum: Currency(usd: 1845.12)
            )
        return mockCrypto
    }
    
    
    // MARK: - People API
    func getPeopleDataFromServer(url: String) async -> [People] {
        
        let mockPeople: [People] = [
                People(name: "Alice Johnson", username: "alicej"),
                People(name: "Bob Smith", username: "bob_smith"),
                People(name: "Charlie Brown", username: "charlieb")
            ]
        return mockPeople
    }
}
