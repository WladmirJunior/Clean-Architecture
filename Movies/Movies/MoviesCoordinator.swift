//
//  MoviesCoordinator.swift
//  Movies
//
//  Created by Wladmir Silva on 16/11/21.
//

import UIKit
import Core

public class MoviesCoordinator: CoordinatorType {
 
    lazy var factory: MoviesFactoryType = {
        return MoviesFactory()
    }()
    
    let moviesNavigation: UINavigationController
    
    public init(navigation: UINavigationController) {
        moviesNavigation = navigation
    }
    
    public func start() {
        let viewController = factory.makeMovieListViewController()        
        viewController.delegate = self
        moviesNavigation.pushViewController(viewController, animated: true)
    }
    
    func openMovieDetail(movie: Movie) {
        let viewController = factory.makeMovieDetailViewController(movie: movie)
        moviesNavigation.pushViewController(viewController, animated: true)
    }
}

extension MoviesCoordinator: MovieListViewControllerDelegate {
    func goToMovieDetail(_ viewController: UIViewController, movie: Movie) {
        openMovieDetail(movie: movie)
    }
}
