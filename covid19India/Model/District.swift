//
//  District.swift
//  covid19India
//
//  Created by Darshan Patel on 2020-04-22.
//  Copyright © 2020 Darshan. All rights reserved.
//

import Foundation
public final class District: Codable {
    
    public let district : String
    public let active : Int
    public let confirmed : Int
    public let deceased : Int
    public let recovered : Int
    public let delta : Delta
    
   
   
    
    enum CodingKeys: String, CodingKey {
        case district
        case active
        case confirmed
        case deceased
        case recovered
        case delta
       
        
    }
    
    init(decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            district = try values.decode(String.self, forKey: .district)
            active = try values.decode(Int.self, forKey: .active)
            confirmed = try values.decode(Int.self, forKey: .confirmed)
            deceased = try values.decode(Int.self, forKey: .deceased)
            recovered = try values.decode(Int.self, forKey: .recovered)
            delta = try values.decode(Delta.self, forKey: .delta)
            
        }
    }
}

