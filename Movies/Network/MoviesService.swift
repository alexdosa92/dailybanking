//
//  MoviesService.swift
//  Movies
//
//  Created by Dósa Alex on 2022. 10. 13..
//

import Foundation

protocol MoviesServiceable {
    func getTrendingMovies() async -> Result<TrendingMovies, NetworkError>
    func getMovieDetail(id: Int) async -> Result<Movie, NetworkError>
    func getGenres() async -> Result<Genres, NetworkError>
}

struct MoviesService: NetworkService, MoviesServiceable {
    func getTrendingMovies() async -> Result<TrendingMovies, NetworkError> {
        return await sendRequest(endpoint: MoviesEndpoint.trending, responseModel: TrendingMovies.self)
    }

    func getMovieDetail(id: Int) async -> Result<Movie, NetworkError> {
        return await sendRequest(endpoint: MoviesEndpoint.movieDetail(id: id), responseModel: Movie.self)
    }

    func getGenres() async -> Result<Genres, NetworkError> {
        return await sendRequest(endpoint: MoviesEndpoint.genres, responseModel: Genres.self)
    }
}
