//
//  MoviesService.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation

class MoviesService {
    func fetchMovies(completion: @escaping (([Movie]?, Error?) -> Void)) {
        guard Connectivity.isConnectedToInternet else {
            if let cachedMovies = Cache.movies {
                let movies = parseMovies(cachedMovies)
                completion(movies, nil)
            }
            return
        }

        APIClient.sendRequest(request: .popularMovies, type: MoviesResponse.self){ [weak self] (response, error) in
            if let response = response {
                Cache.movies = response.results
                let movies = self?.parseMovies(response.results)
                completion(movies, nil)
            } else if let error = error {
                completion(nil, error)
            }
        }
    }
    
    private func parseMovies(_ movies: [MoviesResponse.Movie]) -> [Movie] {
        movies.map { movie in
            Movie(id: movie.id, popularity: movie.popularity, voteCount: movie.voteCount, video: movie.video, posterPath: movie.posterPath, adult: movie.adult, backdropPath: movie.backdropPath, originalLanguage: movie.originalLanguage, originalTitle: movie.originalTitle, title: movie.title, voteAverage: movie.voteAverage, overview: movie.overview, releaseDate: movie.releaseDate)
        }
    }
}
