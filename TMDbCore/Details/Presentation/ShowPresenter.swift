//
//  ShowPresenter.swift
//  TMDbCore
//
//  Created by Gema Martinez on 6/12/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

final class ShowPresenter: DetailPresenter {
    private let detailNavigator: DetailNavigator
    private let repository: ShowsRepositoryProtocol
    private let dateFormatter: DateFormatter
    
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    
    weak var view: DetailView?
    
    init(detailNavigator: DetailNavigator,
         repository: ShowsRepositoryProtocol,
         dateFormatter: DateFormatter,
         identifier: Int64 ){
        self.repository = repository
        self.dateFormatter = dateFormatter
        self.identifier = identifier
        self.detailNavigator = detailNavigator
    }
    
    func didLoad() {
        view?.setLoading(true)
        
        repository.show(withIdentifier: identifier)
            .map { [weak self] show in
                self?.detailSections(for: show) ?? []
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
    
    private func detailSections(for show: ShowDetail) -> [DetailSection] {
        var detailSections: [DetailSection] = [
            .header(DetailHeader(show: show, dateFormatter: dateFormatter))
        ]
        
        if let overview = show.overview,
            overview != "" {
            detailSections.append(.about(title: "Overview".localizedString(), detail: overview))
        }
        
        let items = show.credits?.cast.map { PosterStripItem(castMember: $0) }
        if let items = items {
            detailSections.append(.posterStrip(title: "Cast".localizedString(), items: items))
        }
        
        return detailSections
    }
}


