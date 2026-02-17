//
//  PeopleModel.swift
//  ButtonFetchingData
//
//  Created by Tejasv Singh on 2/13/26.
//

struct People: Decodable{
    let name: String?
    let username: String?
    
    enum CodingKeys: String, CodingKey{
        case name = "name"
        case username = "username"
    }
}
