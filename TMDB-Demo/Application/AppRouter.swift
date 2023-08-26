//
//  AppRouter.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation
import UIKit

class AppRouter {
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let viewControllerFactory = ViewControllerFactory()
        let viewController = viewControllerFactory.moviesViewController(navigationController: navigationController)
        navigationController.pushViewController(viewController, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
