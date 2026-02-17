//
//  CryptoModel.swift
//  ButtonFetchingData
//
//  Created by Tejasv Singh on 2/13/26.
//

struct CryptoModel: Decodable{
    let bitcoin: Currency?
    let ethereum: Currency?
    
    enum CodingKeys: String, CodingKey{
        case bitcoin = "bitcoin"
        case ethereum = "ethereum"
    }
}
struct Currency: Decodable{
    let usd: Double?
    enum CodingKeys: String, CodingKey{
        case usd = "usd"
    }
}
