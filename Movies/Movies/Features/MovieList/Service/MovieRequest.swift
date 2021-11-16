//
//  MovieRequest.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation
import Networking

public enum MovieRequest: Request {
    case getPopularMovies
    case getTopRatedMovies
    case getDetailMovie(id: String)
    
    public var route: String {
        let base: String = "https://api.themoviedb.org/3"
        switch self {
        case .getPopularMovies: return "\(base)/movie/popular"
        case .getTopRatedMovies: return "\(base)/movies/top_rated"
        case let .getDetailMovie(id): return "\(base)/movie/\(id)"
        }
    }
    
    public var method: HttpMethod {
        switch self {
        case .getPopularMovies,
             .getTopRatedMovies,
             .getDetailMovie:
            return .get
        }
    }
    
    public var body: Data? {
        switch self {
        case .getPopularMovies,
             .getTopRatedMovies,
             .getDetailMovie:
            return nil
        }
    }
    
    public var authorization: AuthorizationType {
        switch self {
        case .getPopularMovies,
             .getTopRatedMovies,
             .getDetailMovie:
            return .withApiKey
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .getPopularMovies,
             .getTopRatedMovies,
             .getDetailMovie:
            return nil
        }
    }
}

