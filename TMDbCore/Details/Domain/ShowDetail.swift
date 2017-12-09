//
//  ShowDetail.swift
//  TMDbCore
//
//  Created by Gema Martinez on 6/12/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct ShowDetail: Decodable {
    let backdropPath: String?
    let identifier: Int64
    let overview: String?
    let posterPath: String?
    let firstAirDate: String?
    let episodes: Int?
    let seasons: Int?
    let title: String
    let credits: Credits?
    
    private enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case identifier = "id"
        case overview
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case episodes = "number_of_episodes"
        case seasons = "number_of_seasons"
        case title = "name"
        case credits
    }
}
