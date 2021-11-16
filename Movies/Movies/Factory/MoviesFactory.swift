//
//  MoviesFactory.swift
//  Movies
//
//  Created by Wladmir Silva on 16/11/21.
//

import Foundation
import Networking

class MoviesFactory: MoviesFactoryType {
    
    private lazy var service: MovieService = {
        let operation = APIClient()
        return MovieService(operation: operation)
    }()
    
    func makeMovieListViewController() -> MovieListViewController {
        let useCase = GetPopularMoviesUseCase(service: service)
        let viewModel = MovieListViewModel(getPopularUseCase: useCase)
        let viewController = MovieListViewController(viewModel: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
    
    func makeMovieDetailViewController(movie: Movie) -> MovieDetailViewController {
        let useCase = GetMovieDetailUseCase(service: service)
        let viewModel = MovieDetailViewModel(movie: movie, getDetailMovieUseCase: useCase)
        let viewController = MovieDetailViewController(viewModel: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
}
