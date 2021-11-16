//
//  MoviesFactoryType.swift
//  Movies
//
//  Created by Wladmir Silva on 16/11/21.
//

import Foundation

protocol MoviesFactoryType {
    
    func makeMovieListViewController() -> MovieListViewController
    func makeMovieDetailViewController(movie: Movie) -> MovieDetailViewController
}
