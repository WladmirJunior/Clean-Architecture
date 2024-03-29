//
//  GetMovieDetailUseCaseResponse.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation

public struct GetMovieDetailUseCaseResponse: Codable {
    public let adult: Bool
    public let backdropPath: String
    public let budget: Int
    public let genres: [Genre]
    public let homepage: String
    public let id: Int
    public let imdbID, originalLanguage, originalTitle, overview: String
    public let popularity: Double
    public let posterPath: String?
    public let productionCompanies: [ProductionCompany]
    public let productionCountries: [ProductionCountry]
    public let releaseDate: String
    public let revenue, runtime: Int
    public let spokenLanguages: [ProductionCountry]
    public let status, tagline, title: String
    public let video: Bool
    public let voteAverage: Double
    public let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

public struct Genre: Codable {
    public let id: Int
    public let name: String
}

public struct ProductionCompany: Codable {
    public let id: Int
    public let logoPath: String?
    public let name, originCountry: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

public struct ProductionCountry: Codable {
    public let name: String

    enum CodingKeys: String, CodingKey {
        case name
    }
}
