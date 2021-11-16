//
//  MovieListViewModel.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import RxSwift
import Foundation

protocol MovieListViewModelType {
    func initState()
}

class MovieListViewModel: MovieListViewModelType {
    
    weak var viewController: MovieListViewControllerType?
    let getPopularUseCase: GetPopularMoviesUseCaseProtocol
    private let disposeBag = DisposeBag()
    
    public init(getPopularUseCase: GetPopularMoviesUseCaseProtocol) {
        self.getPopularUseCase = getPopularUseCase
    }
    
    func initState() {
        getPopularUseCase.execute()
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] result in
                self?.showScreen(result)
            } onError: { error in
                print(error)
            }.disposed(by: disposeBag)
    }
    
    private func showScreen(_ result: GetPopularMoviesUseCaseResponse?) {
        guard let data = result else { return }
        let movies = data.results?.compactMap { movie in
            Movie(title: movie.title,
                  id: movie.id,
                  image: URL(string: movie.backdropPath ?? ""),
                  releaseDate: movie.releaseDate,
                  categories: movie.genreIds.map { $0.description }
            )
        } ?? []
        viewController?.updateMovies(with: movies)
    }
}

