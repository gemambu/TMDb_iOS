//
//  PosterStripItem+CastMember.swift
//  TMDbCore
//
//  Created by Gema on 08/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension PosterStripItem {
    init(castMember: Credits.CastMember){
        identifier = castMember.identifier
        mediaType = .person
        title = castMember.name
        metadata = castMember.character
        posterPath = castMember.profilePath
    }
    
    init(movie: CombinedCredits.Credit){
        identifier = movie.identifier
        
        if movie.mediaType == "tv" {
            mediaType = .show
            metadata = "show"
        } else {
            mediaType = .movie
            metadata = "movie"
        }
        
        title = (movie.title != nil ? movie.title : movie.name != nil ? movie.name : "")!
        posterPath = movie.posterPath
        
    }
}

