//
//  TrendingMovies.swift
//  Movies
//
//  Created by Dósa Alex on 2022. 10. 14..
//

import Foundation

struct TrendingMovies: Codable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Movie]

 
}
