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
        let episodes = "\(show.episodes ?? 0 )" + "episodes".localizedString()
        let seasons = "\(show.seasons ?? 0)" + "seasons".localizedString()
        
        metadata = [year, seasons, episodes].flatMap { $0 }.joined(separator: " · ")
        
        
    }
}

