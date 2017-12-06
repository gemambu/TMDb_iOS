//
//  DetailAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 30/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final class DetailAssembly {
    private let imageLoadingAssembly: ImageLoadingAssembly
    private let webServiceAssembly: WebServiceAssembly
    private let navigationController: UINavigationController
    
    init(imageLoadingAssembly: ImageLoadingAssembly,
         navigationController: UINavigationController,
         webServiceAssembly: WebServiceAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.navigationController = navigationController
        self.webServiceAssembly = webServiceAssembly
    }
    
    func detailHeaderPresenter() -> DetailHeaderPresenter {
        return DetailHeaderPresenter(imageRepository: imageLoadingAssembly.imageRepository)
    }
    
    func posterStripPresenter() -> PosterStripPresenter {
        return PosterStripPresenter(imageRepository: imageLoadingAssembly.imageRepository)
    }
    
    func detailNavigator() -> DetailNavigator {
        return PhoneDetailNavigator(navigationController: navigationController,
                                    viewControllerProvider: self)
    }
    
    func moviePresenter(identifier: Int64) -> DetailPresenter {
        return MoviePresenter(detailNavigator: detailNavigator(),
                              repository: movieRepository(),
                              dateFormatter: webServiceAssembly.dateFormatter,
                              identifier: identifier)
    }
    
    func showPresenter(identifier: Int64) -> DetailPresenter {
        return ShowPresenter(detailNavigator: detailNavigator(),
                              repository: showRepository(),
                              dateFormatter: webServiceAssembly.dateFormatter,
                              identifier: identifier)
    }
    
    func movieRepository() -> MoviesRepositoryProtocol{
        return MoviesRepository(webService: webServiceAssembly.webService)
    }
    
    func showRepository() -> ShowsRepositoryProtocol{
        return ShowsRepository(webService: webServiceAssembly.webService)
    }
    
    func personPresenter(identifier: Int64) -> DetailPresenter {
        return PersonPresenter(detailNavigator: detailNavigator(),
                               repository: personRepository(),
                               dateFormatter: webServiceAssembly.dateFormatter,
                               identifier: identifier)
    }
    
    func personRepository() -> PersonsRepositoryProtocol{
        return PersonsRepository(webService: webServiceAssembly.webService)
    }
}

extension DetailAssembly: DetailViewControllerProvider {
    // FIXME: Temporary!!
    private class DummyDetailPresenter: DetailPresenter {
        var view: DetailView?
        
        func didLoad() {}
        func didSelect(item: PosterStripItem) {}
    }
    
    func detailViewController(identifier: Int64, mediaType: MediaType) -> UIViewController {
        
        let presenter: DetailPresenter
        
        switch mediaType {
        case .movie:
            presenter = moviePresenter(identifier: identifier)
        case .show:
            presenter = showPresenter(identifier: identifier)
        case .person:
            presenter = personPresenter(identifier: identifier)
        default:
            presenter = DummyDetailPresenter()
        }
        
        return DetailViewController(presenter: presenter,
                                    headerPresenter: detailHeaderPresenter(),
                                    posterStripPresenter: posterStripPresenter())
    }
}

