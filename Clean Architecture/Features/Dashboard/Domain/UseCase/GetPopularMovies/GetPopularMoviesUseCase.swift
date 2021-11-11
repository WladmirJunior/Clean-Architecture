//
//  GetPopularMoviesUseCase.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation
import RxSwift

class GetPopularMoviesUseCase {
 
    private let disposeBag = DisposeBag()
    private let service: DashboardServiceProtocol
    
    public init(service: DashboardServiceProtocol) {
        self.service = service
    }
}

extension GetPopularMoviesUseCase: GetPopularMoviesUseCaseProtocol {
 
    public func execute() -> Observable<GetPopularMoviesUseCaseResponse> {
        let observer = ReplaySubject<GetPopularMoviesUseCaseResponse>.create(bufferSize: 1)
        let request = DashboardRequest.getPopularMovies
        
        service.getPopularMovies(with: request) { result in
            switch result {
            case .success(let data): observer.onNext(data)
            case .failure(let error): observer.onError(error)
            }
        }
        
        return observer
    }
}


