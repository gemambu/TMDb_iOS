import Foundation

extension DetailHeader {
    init(person: PersonDetail, dateFormatter: DateFormatter) {
        title = person.name!
        posterPath = person.profilePath
        backdropPath = person.taggedImages != nil ? person.taggedImages?.file_path : person.credits?.cast.first?.posterPath
        
        let birthDate = person.birthDate.flatMap{ dateFormatter.date(from: $0) }.flatMap{ dateFormatter.string(from: $0)}
        let deathDate = person.deathDate.flatMap{ dateFormatter.date(from: $0) }.flatMap{ dateFormatter.string(from: $0)}
        
        metadata = [birthDate, deathDate]
            .flatMap { $0 }
            .joined(separator: " / ")
    }
    
}


