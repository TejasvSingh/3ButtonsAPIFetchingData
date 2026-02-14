//
//  CryptoVM.swift
//  ButtonFetchingData
//
//  Created by Tejasv Singh on 2/13/26.
//

protocol CryptoViewModelProtocol {
    func getCryptoDataFromServer() async -> CryptoModel?
}

class CryptoViewModel: CryptoViewModelProtocol {
    
    // MARK: - Properties
    private var service: UsersNetworkManagerProtocol?
    private var cryptos: CryptoModel?
    
    // MARK: - Initializer
    init(service: UsersNetworkManagerProtocol? = nil) {
        self.service = service
    }
    
    // MARK: - Methods
    func getCryptoDataFromServer() async -> CryptoModel? {
        cryptos = await service?.getCurrencyDataFromServer(url: Server.cryptoUrl.rawValue)
        print("checking crypto message")
        return cryptos
    }
}

