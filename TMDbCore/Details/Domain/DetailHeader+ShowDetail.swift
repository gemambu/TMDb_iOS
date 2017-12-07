//
//  DetailHeader+ShowDetail.swift
//  TMDbCore
//
//  Created by Gema Martinez on 6/12/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(show: ShowDetail, dateFormatter: DateFormatter) {
        title = show.title
        posterPath = show.posterPath
        backdropPath = show.backdropPath
        
        let firstAirDate = show.firstAirDate.flatMap{ dateFormatter.date(from: $0) }
        let year = (firstAirDate?.year).map { String($0) }
        let episodes = "\(show.episodes)" + "episodes".localizedString()
        
        metadata = [year, episodes].flatMap { $0 }.joined(separator: " - ")
        
        
    }
}

