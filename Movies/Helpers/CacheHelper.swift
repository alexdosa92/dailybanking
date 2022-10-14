//
//  CacheHelper.swift
//  Movies
//
//  Created by Dósa Alex on 2022. 10. 14..
//

import Foundation

struct CacheHelper {

    func save(favoriteIDs: [Int]) {
        let encoder = JSONEncoder()

        if let data = try? encoder.encode(favoriteIDs) {
            UserDefaults.standard.set(data, forKey: "favoriteIDsList")
        }
    }

    func read() -> [Int] {
        let decoder = JSONDecoder()

        if let encoded =  UserDefaults.standard.object(forKey: "favoriteIDsList") as? Data {
            let trendingMovies = (try? decoder.decode([Int].self, from: encoded)) ?? []
            return trendingMovies
        }
        return []
    }
}
