//
//  Credits.swift
//  TMDbCore
//
//  Created by Gema on 08/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct CombinedCredits: Decodable {
    struct Credit: Decodable {
        let identifier: Int64
        let name: String?
        let overview: String?
        let posterPath: String?
        let mediaType: String
        let title: String?
        
        
        private enum CodingKeys: String, CodingKey {
            case identifier = "id"
            case title
            case name
            case mediaType = "media_type"
            case overview
            case posterPath = "poster_path"
            
        }
    }
    
    let cast: [Credit]
}

