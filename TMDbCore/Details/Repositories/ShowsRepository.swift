//
//  ShowsRepository.swift
//  TMDbCore
//
//  Created by Gema Martinez on 6/12/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

protocol ShowsRepositoryProtocol {
    
    func show(withIdentifier identifier: Int64) -> Observable<ShowDetail>
}

final class ShowsRepository: ShowsRepositoryProtocol {
    
    let webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    func show(withIdentifier identifier: Int64) -> Observable<ShowDetail> {
        return webService.load(ShowDetail.self, from: .show(identifier: identifier))
    }
}

