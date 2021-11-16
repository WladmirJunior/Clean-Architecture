//
//  MovieServiceProtocol.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation

public protocol MovieServiceProtocol {
    func getPopularMovies(with request: MovieRequest, completionHandler: @escaping (Result<GetPopularMoviesUseCaseResponse, Error>) -> Void)
    func getTopRatedMovies(with request: MovieRequest, completionHandler: @escaping (Result<GetMovieDetailUseCaseResponse, Error>) -> Void)
    func getDetailMovie(with request: MovieRequest, completionHandler: @escaping (Result<GetMovieDetailUseCaseResponse, Error>) -> Void)
}
