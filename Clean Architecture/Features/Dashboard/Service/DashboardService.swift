//
//  DashboardService.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation
import Networking
import RxSwift

public enum DashboardServiceError: Error {
    case unknow(String)
    case empty
}


class DashboardService: DashboardServiceProtocol {
    
    private let operation: APIClientProtocol
    private let disposeBag = DisposeBag()
    
    public init(operation: APIClientProtocol) {
        self.operation = operation
    }
    
    func getPopularMovies(with request: DashboardRequest, completionHandler: @escaping (Result<GetPopularMoviesUseCaseResponse, Error>) -> Void) {
        
        operation.execute(request: request, responseType: GetPopularMoviesUseCaseResponse.self) { serviceResult in
            switch serviceResult {
            case .success(let data): completionHandler(.success(data))
            case .failure(let error): completionHandler(.failure(DashboardServiceError.unknow(error.localizedDescription)))
            }
        }
    }
    
    func getTopRatedMovies(with request: DashboardRequest, completionHandler: @escaping (Result<GetMovieDetailUseCaseResponse, Error>) -> Void) {
        
    }
    
    func getDetailMovie(with request: DashboardRequest, completionHandler: @escaping (Result<GetMovieDetailUseCaseResponse, Error>) -> Void) {
        
        operation.execute(request: request, responseType: GetMovieDetailUseCaseResponse.self) { serviceResult in
            switch serviceResult {
            case .success(let data): completionHandler(.success(data))
            case .failure(let error): completionHandler(.failure(DashboardServiceError.unknow(error.localizedDescription)))
            }
        }
    }
}
