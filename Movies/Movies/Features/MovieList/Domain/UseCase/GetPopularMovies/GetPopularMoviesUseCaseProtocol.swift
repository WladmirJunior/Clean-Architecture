//
//  GetPopularMoviesUseCaseProtocol.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import RxSwift
import Foundation

protocol GetPopularMoviesUseCaseProtocol: AnyObject {
    func execute() -> Observable<GetPopularMoviesUseCaseResponse>
}
