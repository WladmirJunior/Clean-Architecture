//
//  GetMovieDetailUseCaseProtocol.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import RxSwift
import Foundation

public protocol GetMovieDetailUseCaseProtocol: AnyObject {
    func execute(_ movie: Movie) -> Observable<GetMovieDetailUseCaseResponse>
}

