//
//  MoviesEndpoint.swift
//  Movies
//
//  Created by Dósa Alex on 2022. 10. 13..
//

import Foundation


enum MoviesEndpoint {
    case trending
    case movieDetail(id: Int)
    case genres
}

extension MoviesEndpoint: Endpoint {
    var path: String {
        switch self {
        case .trending:
            return "/3/trending/movie/week"
        case .movieDetail(let id):
            return "/3/movie/\(id)"
        case .genres:
            return "/3/genre/movie/list"
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .trending, .movieDetail, .genres:
            return  [URLQueryItem(name: "api_key", value: APIkey)]
        }
    }

    var method: RequestType {
        switch self {
        case .trending, .movieDetail, .genres:
            return .get
        }
    }

    var header: [String: String]? {
        switch self {
        case .trending, .movieDetail, .genres:
            return [
               // "Authorization": "Bearer \(APIkey)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }

    var body: [String: String]? {
        switch self {
        case .trending, .movieDetail, .genres:
            return nil
        }
    }
}
