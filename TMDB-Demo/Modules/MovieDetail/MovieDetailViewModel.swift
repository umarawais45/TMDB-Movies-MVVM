//
//  MovieDetailViewModel.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation
import Combine

class MovieDetailViewModel {
    @Published var title: String = ""
    @Published var imagePath: String = ""
    @Published var description: String = ""

    var movie: Movie!

    init(movie: Movie) {
        self.movie = movie
    }

    func fetchMovieDetails() {
        self.title = movie.title
        self.imagePath = movie.posterPath ?? ""
        self.description = movie.overview
    }
}
