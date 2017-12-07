
import RxSwift

final class PersonPresenter: DetailPresenter {
    
    private let detailNavigator: DetailNavigator
    private let repository: PersonsRepositoryProtocol
    private let dateFormatter: DateFormatter
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    
    private var taggedImage: TaggedImages?
    
    weak var view: DetailView?
    
    init(detailNavigator: DetailNavigator,
         repository: PersonsRepositoryProtocol,
         dateFormatter: DateFormatter,
         identifier: Int64 ){
        self.detailNavigator = detailNavigator
        self.repository = repository
        self.dateFormatter = dateFormatter
        self.identifier = identifier
    }
    

    func didLoad() {
        view?.setLoading(true)
        
             
        repository
            .image(withIdentifier: identifier)
            .map{ [weak self] image in
                if(image.first != nil){
                    self?.taggedImage = image.first
                }
            }
            .observeOn(MainScheduler.instance)
            .subscribe()
            .disposed(by: disposeBag)
        
        repository
            .person(withIdentifier: identifier)
            .map { [weak self] person in
                var nreP = person
                nreP.taggedImages = self?.taggedImage
                return self?.detailSections(for: nreP) ?? []
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
                                   mediaType: item.mediaType)
    }
    
    private func detailSections(for person: PersonDetail) -> [DetailSection] {
        var detailSections: [DetailSection] = [
            .header(DetailHeader(person: person, dateFormatter: dateFormatter))
        ]
        
        if let overview = person.biography,
            overview != "" {
            detailSections.append(.about(title: "Biography", detail: overview))
        }
        
        let items = person.credits?.cast.map { PosterStripItem(movie: $0) }
        if let items = items {
            detailSections.append(.posterStrip(title: "Works", items: items))
        }
        
        return detailSections
    }

}


