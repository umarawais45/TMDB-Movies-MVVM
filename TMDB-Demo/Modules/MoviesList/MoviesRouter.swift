//
//  MoviesRouter.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation
import UIKit

class MoviesRouter {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func routeToMovieDetails(movie: Movie) {
        let viewModel = MovieDetailViewModel(movie: movie)
        let viewController = ViewControllerFactory().movieDetailViewController(navigationController: navigationController, movie: movie)
        viewController.title = "Movie Details"
        navigationController.pushViewController(viewController, animated: true)
    }
}
