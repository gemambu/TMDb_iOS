//
//  TaggedImages.swift
//  TMDbCore
//
//  Created by Gema Martinez on 29/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct TaggedImages: Decodable {
    let file_path: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case file_path
    }
}

