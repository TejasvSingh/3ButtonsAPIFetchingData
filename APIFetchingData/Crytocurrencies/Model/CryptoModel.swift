//
//  CryptoModel.swift
//  ButtonFetchingData
//
//  Created by Tejasv Singh on 2/13/26.
//

struct CryptoModel: Decodable{
    let bitcoin: Currency?
    let ethereum: Currency?
}
struct Currency: Decodable{
    let usd: Double?
}
