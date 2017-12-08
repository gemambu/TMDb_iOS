//
//  Credits.swift
//  TMDbCore
//
//  Created by Gema on 08/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct TaggedImages: Decodable {
//    struct ImageData: Decodable {
        let posterPath: String?
        let mediaType: String
        
        private enum CodingKeys: String, CodingKey {
            case mediaType = "media_type"
            case posterPath = "file_path"
        }
//    }
//
//    let results: [ImageData]
}

