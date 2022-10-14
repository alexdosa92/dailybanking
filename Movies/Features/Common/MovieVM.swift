//
//  MovieVM.swift
//  Movies
//
//  Created by Foundation on 2022. 02. 14..
//

import Foundation

struct MovieVM: Identifiable, Codable {
    struct Image: Codable {
        let small: String
        let large: String
    }

    let id: Int
    let title: String
    let genres: String
    let overView: String
    let image: Image
    let popularity: Float
    var isMarked: Bool
}
