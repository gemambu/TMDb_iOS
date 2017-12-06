//
//  MoviePresenter.swift
//  TMDbCore
//
//  Created by Gema on 08/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

final class MoviePresenter: DetailPresenter {
    private let detailNavigator: DetailNavigator
    private let repository: MoviesRepositoryProtocol
    private let dateFormatter: DateFormatter
    
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    
    weak var view: DetailView?
    
    init(detailNavigator: DetailNavigator,
         repository: MoviesRepositoryProtocol,
         dateFormatter: DateFormatter,
         identifier: Int64 ){
        self.repository = repository
        self.dateFormatter = dateFormatter
        self.identifier = identifier
        self.detailNavigator = detailNavigator
    }
    
    func didLoad() {
        view?.setLoading(true)
        
        repository.movie(withIdentifier: identifier)
            .map { [weak self] movie in
                self?.detailSections(for: movie) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] sections in
                self?.view?.update(with: sections)
                },
                       onDisposed: { [weak self] in // onDisposed SIEMPRE se ejecuta
                        self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
        
    }
    
    func didSelect(item: PosterStripItem) {
        detailNavigator.showDetail(withIdentifier: item.identifier,
                                   mediaType: .person)
    }
    
    private func detailSections(for movie: MovieDetail) -> [DetailSection] {
        var detailSections: [DetailSection] = [
            .header(DetailHeader(movie: movie, dateFormatter: dateFormatter))
        ]
        
        if let overview = movie.overview,
            overview != "" {
            detailSections.append(.about(title: "Overview", detail: overview))
        }
        
        let items = movie.credits?.cast.map { PosterStripItem(castMember: $0) }
        if let items = items {
            detailSections.append(.posterStrip(title: "Cast", items: items))
        }
        
        return detailSections
    }
}

