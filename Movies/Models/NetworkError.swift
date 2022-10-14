//
//  NetworkError.swift
//  Movies
//
//  Created by Dósa Alex on 2022. 10. 13..
//

import Foundation

enum NetworkError: Error {
    case decode
    case invalidURL
    case noResponse
    case unknown

    var customMessage: String {
        switch self {
        default:
            return "Unknown error"
        }
    }
}
