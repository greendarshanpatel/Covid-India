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
    public let districtData: [District]
    public let statecode : String
    enum CodingKeys: String, CodingKey {
        case state
        case districtData
        case statecode
    }
    
    init(decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            state = try values.decode(String.self, forKey: .state)
            districtData = try values.decode([District].self, forKey: .districtData)
            statecode = try values.decode(String.self, forKey: .statecode)
        }
    }
}

public final class StateResponce:Codable {
    
    public let data : [State]
    
    enum CodingKeys: String, CodingKey {
        case data
        
    }
    
    init(decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decode([State].self, forKey: .data)
            
        }
    }
}
