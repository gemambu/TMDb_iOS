//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by Gema Martinez on 25/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable {
    public private(set) var identifier: Int64
    let name: String?
    let birthDate: String?
    let deathDate: String?
    let biography: String?
    let profilePath: String?
    let credits: CombinedCredits?
    var taggedImages: TaggedImages?
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case birthDate = "birthday"
        case deathDate = "deathday"
        case biography
        case profilePath = "profile_path"
        case credits = "combined_credits"
        case taggedImages = "tagged_images"
        
    }
}

