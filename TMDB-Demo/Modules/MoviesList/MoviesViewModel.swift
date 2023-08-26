//
//  MoviesViewModel.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation

class MoviesViewModel {
    @Published var movies: [Movie] = []
    var moviesService = MoviesService()
    
    func fetchMovies() {
        moviesService.fetchMovies() { [weak self] movies, error in
            if let movies {
                self?.movies = movies
            } else if let error {
                debugPrint((error as? APIError)?.errorDescription ?? "")
            }
        }
    }
}
