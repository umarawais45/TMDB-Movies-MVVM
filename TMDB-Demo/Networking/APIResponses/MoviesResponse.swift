//
//  MoviesResponse.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation

struct MoviesResponse : Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decode(Int.self, forKey: .page)
        totalResults = try values.decode(Int.self, forKey: .totalResults)
        totalPages = try values.decode(Int.self, forKey: .totalPages)
        results = try values.decode([Movie].self, forKey: .results)
    }

    struct Movie: Codable {
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

        enum CodingKeys: String, CodingKey {
            case id
            case popularity
            case voteCount = "vote_count"
            case video
            case posterPath = "poster_path"
            case adult
            case backdropPath = "backdrop_path"
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case title
            case voteAverage = "vote_average"
            case overview
            case releaseDate = "release_date"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decode(Int64.self, forKey: .id)
            popularity = try values.decode(Double.self, forKey: .popularity)
            voteCount = try values.decode(Int32.self, forKey: .voteCount)
            video = try values.decode(Bool.self, forKey: .video)
            posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
            adult = try values.decode(Bool.self, forKey: .adult)
            backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
            originalLanguage = try values.decode(String.self, forKey: .originalLanguage)
            originalTitle = try values.decode(String.self, forKey: .originalTitle)
            title = try values.decode(String.self, forKey: .title)
            voteAverage = try values.decode(Double.self, forKey: .voteAverage)
            overview = try values.decode(String.self, forKey: .overview)
            releaseDate = try values.decode(String.self, forKey: .releaseDate)
        }
    }
}
