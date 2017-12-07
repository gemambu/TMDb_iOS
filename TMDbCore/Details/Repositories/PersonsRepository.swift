

import RxSwift

protocol PersonsRepositoryProtocol {
    
    func person(withIdentifier identifier: Int64) -> Observable<PersonDetail>
    func image(withIdentifier identifier: Int64) ->  Observable<[TaggedImages]>
}

final class PersonsRepository: PersonsRepositoryProtocol {
    
    let webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    func image(withIdentifier identifier: Int64) ->  Observable<[TaggedImages]> {
        return webService
            .load(Page<TaggedImages>.self,
                  from: .taggedImages(identifier:identifier))
            .map{ $0.results }
    }
    
    
    func person(withIdentifier identifier: Int64) ->  Observable<PersonDetail> {
        return webService
                    .load(PersonDetail.self,
                          from: .person(identifier: identifier))

    }
    
}
