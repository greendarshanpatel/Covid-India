//
//  Delta.swift
//  covid19India
//
//  Created by Darshan Patel on 2020-04-22.
//  Copyright © 2020 Darshan. All rights reserved.
//

import Foundation
public final class Delta: Codable {
    
    public let confirmed : Int
    public let deceased : Int
    public let recovered : Int
   
    
    enum CodingKeys: String, CodingKey {
        case confirmed
        case deceased
        case recovered
       
        
    }
    
    init(decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            confirmed = try values.decode(Int.self, forKey: .confirmed)
            deceased = try values.decode(Int.self, forKey: .deceased)
            recovered = try values.decode(Int.self, forKey: .recovered)
            
        }
    }
}

