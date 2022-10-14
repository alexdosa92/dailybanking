//
//  Endpoint.swift
//  Movies
//
//  Created by Dósa Alex on 2022. 10. 13..
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var body: [String: String]? { get }
    var host: String { get }
    var method: RequestType { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var header: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.themoviedb.org"
    }
}
