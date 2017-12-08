

import RxSwift

protocol PersonsRepositoryProtocol {
    func person(withIdentifier identifier: Int64) -> Observable<PersonDetail>
}

final class PersonsRepository: PersonsRepositoryProtocol {
    
    let webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    
    func person(withIdentifier identifier: Int64) ->  Observable<PersonDetail> {
        return webService
            .load(PersonDetail.self,
                  from: .person(identifier: identifier))
    }
    
}
