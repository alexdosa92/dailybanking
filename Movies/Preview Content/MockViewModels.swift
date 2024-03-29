//
//  MockViewModels.swift
//  Movies
//
//  Created by Foundation on 2022. 02. 14..
//

import Foundation

class MockViewModel: MoviesScreenViewModelProtocol {
    func fetchTrendingMovies() {
        
    }

    func fetchGenres() {
        
    }

    func checkFavoriteMovies() {
    }
    
    var movies: [MovieVM] = previewMovies
}

class MockMovieDetailsViewModel: MovieDetailsScreenViewModelProtocol {
    let movie: MovieVM = previewMovies[0]

    func markMovie() {}
}
