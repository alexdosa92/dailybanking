//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Foundation on 2022. 02. 14..
//

import Foundation

class MoviesScreenViewModel: ObservableObject, MoviesScreenViewModelProtocol {
    @Published var movies: [MovieVM] = []
    private let service = MoviesService()
    private var genres: [Genre] = []
    private var cacheHelper = CacheHelper()

    func fetchTrendingMovies() {
        Task { @MainActor in
            let result = await service.getTrendingMovies()
            switch result {
            case .success(let moviesResponse):
                movies = moviesResponse.results.map { return MovieVM(id: $0.id, title: $0.title, genres: self.getGenreNames(ids: $0.genreIds), overView: $0.overview, image: MovieVM.Image(small: "https://image.tmdb.org/t/p/w500/"+($0.posterPath ?? ""), large: "https://image.tmdb.org/t/p/w500/"+($0.posterPath ?? "")), popularity: $0.popularity, isMarked: isMovieFav(id: $0.id))
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func fetchGenres() {
        Task(priority: .background) {
            let result = await service.getGenres()
            switch result {
            case .success(let genresResponse):
                genres = genresResponse.genres
                fetchTrendingMovies()
            case .failure(let error):
                print(error)
            }
        }
    }

    func isMovieFav(id: Int) -> Bool {
        var favList = cacheHelper.read()
        return favList.contains(id)
    }

    func getGenreNames(ids: [Int]) -> (String) {
        var genreNames = ""
        for id in ids {
            if let newGenre = genres.first(where: { genre in
                return id == genre.id
            }) {
                genreNames = genreNames + newGenre.name + " "
            }
        }
        return genreNames
    }
}
