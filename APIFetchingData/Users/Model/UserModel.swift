//
//  UserModel.swift
//  ButtonFetchingData
//
//  Created by Tejasv Singh on 2/13/26.
//

struct Users: Decodable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
    
    enum CodingKeys: String, CodingKey{
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}

