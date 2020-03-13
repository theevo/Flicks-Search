//
//  Movie.swift
//  Flicks Search
//
//  Created by theevo on 3/13/20.
//  Copyright © 2020 Theo Vora. All rights reserved.
//

import Foundation

struct TopLevelObject: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let title: String
    let rating: String
    let description: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case rating = "vote_average"
        case description = "overview"
        case posterPath = "poster_path"
    }
}
