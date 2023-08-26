//
//  ViewControllerFactory.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation
import UIKit

class ViewControllerFactory {
    func moviesViewController(navigationController: UINavigationController) -> MoviesViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: MoviesViewController.storyboardIdentifier) as! MoviesViewController
        viewController.viewModel = MoviesViewModel()
        viewController.router = MoviesRouter(navigationController: navigationController)
        return viewController
    }
    
    func movieDetailViewController(navigationController: UINavigationController) -> MovieDetailViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: MovieDetailViewController.storyboardIdentifier) as! MovieDetailViewController
        viewController.viewModel = MovieDetailViewModel()
        return viewController
    }
}
