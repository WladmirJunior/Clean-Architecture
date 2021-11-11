//
//  MainCoordinator.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import UIKit
import Networking

public class MainCoordinator {
    lazy var mainNavigation: UINavigationController = {
        return UINavigationController()
    }()
    
    lazy var dashboardService: DashboardServiceProtocol = {
        return DashboardService(operation: APIClient())
    }()
}

extension MainCoordinator: StartViewControllerDelegate {
    func goToMainScreen(_ startViewController: StartViewController) {
        let getPopularMovieUseCase = GetPopularMoviesUseCase(service: dashboardService)
        let viewModel = DashboardViewModel(getPopularUseCase: getPopularMovieUseCase)
        let dashboardViewController = DashboardViewController(viewModel: viewModel)
        viewModel.viewController = dashboardViewController
        dashboardViewController.delegate = self
        mainNavigation = UINavigationController(rootViewController: dashboardViewController)
        mainNavigation.modalPresentationStyle = .fullScreen
        startViewController.present(mainNavigation, animated: true)
    }
}

extension MainCoordinator: DashboardViewControllerDelegate {
    func goToMovieDetailScreen(_ dashboardViewController: DashboardViewController, movie: Movie) {
        let getDetailMovieUseCase = GetMovieDetailUseCase(service: dashboardService)
        let viewModel = MovieDetailViewModel(movie: movie, getDetailMovieUseCase: getDetailMovieUseCase)
        let detailViewController = MovieDetailViewController(viewModel: viewModel)
        viewModel.viewController = detailViewController
        mainNavigation.pushViewController(detailViewController, animated: true)
    }
}

