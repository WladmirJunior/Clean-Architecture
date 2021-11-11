//
//  DashboardServiceProtocol.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation

protocol DashboardServiceProtocol {
    func getPopularMovies(with request: DashboardRequest, completionHandler: @escaping (Result<GetPopularMoviesUseCaseResponse, Error>) -> Void)
    func getTopRatedMovies(with request: DashboardRequest, completionHandler: @escaping (Result<GetMovieDetailUseCaseResponse, Error>) -> Void)
    func getDetailMovie(with request: DashboardRequest, completionHandler: @escaping (Result<GetMovieDetailUseCaseResponse, Error>) -> Void)
}
