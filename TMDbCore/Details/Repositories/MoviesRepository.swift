//
//  MovieRepository.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 08/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

protocol MoviesRepositoryProtocol {
    
    func movie(withIdentifier identifier: Int64) -> Observable<MovieDetail>
}

final class MoviesRepository: MoviesRepositoryProtocol {
    
    let webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    func movie(withIdentifier identifier: Int64) -> Observable<MovieDetail> {
        return webService.load(MovieDetail.self, from: .movie(identifier: identifier))
    }
}
