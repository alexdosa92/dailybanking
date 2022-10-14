//
//  MovieDetailsScreenViewModel.swift
//  Movies
//
//  Created by Foundation on 2022. 02. 14..
//

import Foundation

class MovieDetailsScreenViewModel: ObservableObject, MovieDetailsScreenViewModelProtocol {
    @Published var movie: MovieVM
    private let cacheHelper = CacheHelper()
    init(movie: MovieVM) {
        self.movie = movie
    }

    func markMovie() {
        var favList = cacheHelper.read()

        if favList.contains(movie.id) {
            cacheHelper.save(favoriteIDs: favList.filter{$0 != movie.id})
        } else {
            favList.append(movie.id)
            cacheHelper.save(favoriteIDs: favList)
        }
        movie.isMarked.toggle()
    }
}
