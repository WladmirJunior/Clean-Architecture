//
//  SceneDelegate.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var dashboardCoordinator = DashboardCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let startViewController = StartViewController()
        let startNavigation = UINavigationController(rootViewController: startViewController)
        startViewController.delegate = dashboardCoordinator
        window.rootViewController = startNavigation
        self.window = window
        window.makeKeyAndVisible()
    }
}

