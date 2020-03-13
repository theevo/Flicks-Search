//
//  MovieController.swift
//  Flicks Search
//
//  Created by theevo on 3/13/20.
//  Copyright © 2020 Theo Vora. All rights reserved.
//

import Foundation

class MovieController {
    
    // MARK: - Private Properties
    
    static private let baseSearchURL = "https://api.themoviedb.org/3/search/movie"
    static private let basePosterURL = "https://image.tmdb.org/t/p/w500"
    static private let apiKeyTMDB = "api_key"
    static private let apiValueTMDB = "fca5a8c85d8154a8d7591cf4881ab8d1"
    static private let searchKeyTMDB = "query"
    
    
    // MARK: - Functions
    
    
    static func fetchMovies( searchTerm: String,
                      completion: @escaping (Result<Movie,MovieError>) -> Void ) {
    }
    
} // end class
