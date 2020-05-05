//
//  State.swift
//  covid19India
//
//  Created by Darshan Patel on 2020-04-22.
//  Copyright © 2020 Darshan. All rights reserved.
//

import Foundation
public final class State: Codable {
    
    public let state : String
    public let district: [District]
    enum CodingKeys: String, CodingKey {
        case state
        case district
    }
    
    init(decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            state = try values.decode(String.self, forKey: .state)
            district = try values.decode([District].self, forKey: .district)
            
        }
    }
}

//public final class UserResponce:Codable {
//    
//    public let status : Int
//    public let message : String
//    public let data : [User]
//    
//    enum CodingKeys: String, CodingKey {
//        case status
//        case message
//        case data
//        
//    }
//    
//    init(decoder: Decoder) throws {
//        do {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            status = try values.decode(Int.self, forKey: .status)
//            message = try values.decode(String.self, forKey: .message)
//            data = try values.decode([User].self, forKey: .data)
//            
//        }
//    }
//    
//    
//}
//"state": "Bihar",
//"districtData": [
//  {
//    "district": "Begusarai",
//    "active": 8,
//    "confirmed": 9,
//    "deceased": 0,
//    "recovered": 1,
//    "delta": {
//      "confirmed": 0,
//      "deceased": 0,
//      "recovered": 0
//    }
//  },
