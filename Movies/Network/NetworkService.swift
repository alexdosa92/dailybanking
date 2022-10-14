//
//  NetworkService.swift
//  Movies
//
//  Created by Dósa Alex on 2022. 10. 13..
//

import Foundation

protocol NetworkService {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, NetworkError>
}

extension NetworkService {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async -> Result<T, NetworkError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.queryItems

        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        print(request)

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            print(response)
            switch response.statusCode {
            case 200...299:
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let decodedResponse = try decoder.decode(responseModel.self, from: data)
                         return .success(decodedResponse)
                    } catch  {
                        print(error)
                        return .failure(.decode)
                    }
            default:
                return .failure(.unknown)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
