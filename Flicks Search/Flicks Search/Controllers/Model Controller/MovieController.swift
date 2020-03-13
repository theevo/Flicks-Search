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
    
    static private let baseSearchURL = URL(string: "https://api.themoviedb.org/3/search/movie")
    static private let basePosterURL = URL(string: "https://image.tmdb.org/t/p/w500")
    static private let apiKeyTMDB = "api_key"
    static private let apiValueTMDB = "fca5a8c85d8154a8d7591cf4881ab8d1"
    static private let searchKeyTMDB = "query"
    
    
    // MARK: - Functions
    
    
    static func fetchMovies( searchTerm: String,
                      completion: @escaping (Result<[Movie],MovieError>) -> Void ) {
        // 1) URL
        guard let baseURL = baseSearchURL else { return completion(.failure(.invalidURL)) }
                
        // 1.1) components
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        urlComponents?.queryItems = [URLQueryItem(name: apiKeyTMDB, value: apiValueTMDB),
        URLQueryItem(name: searchKeyTMDB, value: searchTerm)]
        
        guard let finalURL = urlComponents?.url else { return completion(.failure(.invalidURL)) }
        print(finalURL)
        
        // 2) DataTask
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            
            // 3) Error Handling
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
            // 4) Check for Data
            guard let data = data else {
                return completion(.failure(.noData))
            }
            
            // 5) Decode
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                
                let movieArray = topLevelObject.results
                
                // successful GET
                return completion(.success(movieArray))
                
            } catch {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
        }.resume()
    } // end fetchMovies
    
} // end class
