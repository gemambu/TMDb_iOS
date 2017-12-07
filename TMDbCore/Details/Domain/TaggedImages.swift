//
//  TaggedImages.swift
//  TMDbCore
//
//  Created by Gema Martinez on 29/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct TaggedImages: Decodable {
    
    
    // let identifier: Int64?
    let file_path: String?
    //let mediaType: String?
    
    
    private enum CodingKeys: String, CodingKey {
        //  case identifier = "id"
        case file_path
        // case mediaType = "media_type"
    }
    
}

