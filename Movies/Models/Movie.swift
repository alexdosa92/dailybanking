//
//  Movie.swift
//  Movies
//
//  Created by Dósa Alex on 2022. 10. 14..
//

import Foundation

struct Movie: Codable {
    let posterPath: String?
    let overview: String
    let adult: Bool
    let id: Int
    let originalTitle: String?
    let title: String
    let genreIds: [Int]
    let popularity: Float
}
 
