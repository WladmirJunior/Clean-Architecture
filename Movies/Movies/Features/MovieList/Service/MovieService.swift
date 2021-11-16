//
//  MovieService.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation
import Networking

public enum MovieServiceError: Error {
    case unknow(String)
    case empty
}


public class MovieService: MovieServiceProtocol {
    
    private let operation: APIClientProtocol
    
    public init(operation: APIClientProtocol) {
        self.operation = operation
    }
    
    public func getPopularMovies(with request: MovieRequest, completionHandler: @escaping (Result<GetPopularMoviesUseCaseResponse, Error>) -> Void) {
        
        operation.execute(request: request, responseType: GetPopularMoviesUseCaseResponse.self) { serviceResult in
            switch serviceResult {
            case .success(let data): completionHandler(.success(data))
            case .failure(let error): completionHandler(.failure(MovieServiceError.unknow(error.localizedDescription)))
            }
        }
    }
    
    public func getTopRatedMovies(with request: MovieRequest, completionHandler: @escaping (Result<GetMovieDetailUseCaseResponse, Error>) -> Void) {
        
    }
    
    public func getDetailMovie(with request: MovieRequest, completionHandler: @escaping (Result<GetMovieDetailUseCaseResponse, Error>) -> Void) {
        
        operation.execute(request: request, responseType: GetMovieDetailUseCaseResponse.self) { serviceResult in
            switch serviceResult {
            case .success(let data): completionHandler(.success(data))
            case .failure(let error): completionHandler(.failure(MovieServiceError.unknow(error.localizedDescription)))
            }
        }
    }
}
