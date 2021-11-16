//
//  GetPopularMoviesUseCaseResponse.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation

public struct GetPopularMoviesUseCaseResponse: Codable {
    public let page: Int
    public let results: [GetPopularMoviesData]?
}

public struct GetPopularMoviesData: Codable {
    public let id: Int
    public let title: String
    public let overview: String?
    public let backdropPath: String?
    public let releaseDate: String
    public let genreIds: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
    }
}
