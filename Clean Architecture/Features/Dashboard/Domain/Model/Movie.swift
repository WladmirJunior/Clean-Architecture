//
//  Movie.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation

public struct Movie {
    public let title: String
    public let id: Int
    public let image: URL?
    public let releaseDate: String
    public let categories: [String]
}

