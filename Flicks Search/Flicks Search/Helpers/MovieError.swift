//
//  MovieError.swift
//  Flicks Search
//
//  Created by theevo on 3/13/20.
//  Copyright © 2020 Theo Vora. All rights reserved.
//

import Foundation

enum MovieError: LocalizedError {
    case thrown(Error)
    case invalidURL
    case noData
    case badData
    case noPoster
    
    var errorDescription: String? {
        switch self {
            
        case .thrown(let error):
            return error.localizedDescription
        case .invalidURL:
            return "Unable to reach server."
        case .noData:
            return "Server responded with no data."
        case .badData:
            return "Server returned bad data."
        case .noPoster:
            return "No poster."
        }
    } // end errorDescription
} // end enum
