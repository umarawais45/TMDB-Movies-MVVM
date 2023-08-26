//
//  Movie.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation

struct Movie {
    let id: Int64
    let popularity: Double
    let voteCount: Int32
    let video: Bool
    let posterPath: String?
    let adult: Bool
    let backdropPath: String?
    let originalLanguage: String
    let originalTitle: String
    let title: String
    let voteAverage: Double
    let overview: String
    let releaseDate: String
}
