//
//  GetMovieDetailUseCase.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation
import RxSwift

class GetMovieDetailUseCase {
 
    private let disposeBag = DisposeBag()
    private let service: MovieServiceProtocol
    
    public init(service: MovieServiceProtocol) {
        self.service = service
    }
}

extension GetMovieDetailUseCase: GetMovieDetailUseCaseProtocol {
 
    public func execute(_ movie: Movie) -> Observable<GetMovieDetailUseCaseResponse> {
        let observer = ReplaySubject<GetMovieDetailUseCaseResponse>.create(bufferSize: 1)
        let request = MovieRequest.getDetailMovie(id: movie.id.description)
        
        service.getDetailMovie(with: request) { result in
            switch result {
            case .success(let data): observer.onNext(data)
            case .failure(let error): observer.onError(error)
            }
        }
        return observer
    }
}

