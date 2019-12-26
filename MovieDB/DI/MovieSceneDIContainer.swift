//
//  MovieSceneDIContainer.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

final class MovieSceneDIContainer {
  init() {
  }

  func loadMovieUseCase() -> MovieListUseCaseInterface {
    return MovieListUseCase(moviesRepository: loadMovieListRepository())
  }
  
  func loadMovieListRepository() -> MovieListRepository {
    return MovieListRepository()
  }
  
  func initMovieListViewController() -> UIViewController {
    return MovieListViewController.create(withViewModel: MovieListViewViewModel(movieUseCase: loadMovieUseCase()),
                                          movieListViewControllerFactory: self)
  }
}

extension MovieSceneDIContainer: MovieListViewControllerFactory {
  func createMovieDetailViewController(withId id: Int) -> UIViewController {
    return MovieDetailViewController.create(with: MovieDetailViewViewModel(movieId: id))
  }
}
