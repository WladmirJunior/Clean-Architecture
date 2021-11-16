//
//  MainCoordinator.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import UIKit
import Networking
import Movies

public class DashboardCoordinator {
    lazy var dashboardNavigation: UINavigationController = {
        return UINavigationController()
    }()
    
    lazy var dashboardService: MovieServiceProtocol = {
        return MovieService(operation: APIClient())
    }()
    
    var moviesCoordinator: MoviesCoordinator?
}

extension DashboardCoordinator: StartViewControllerDelegate {
    func goNext(_ viewController: UIViewController) {
        let dashboardViewController = DashboardViewController()
        dashboardViewController.delegate = self
        dashboardNavigation = UINavigationController(rootViewController: dashboardViewController)
        dashboardNavigation.modalPresentationStyle = .fullScreen
        viewController.present(dashboardNavigation, animated: true)
    }
}

extension DashboardCoordinator: DashboardViewControllerDelegate {
    func goToMovies(_ viewController: UIViewController) {
        moviesCoordinator = MoviesCoordinator(navigation: dashboardNavigation)
        moviesCoordinator?.start()
    }
}

