//
//  MovieTableViewCell.swift
//  Flicks Search
//
//  Created by theevo on 3/13/20.
//  Copyright © 2020 Theo Vora. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var movie: Movie? {
        didSet{
            guard let movieLandedOnCell = movie else { return }
            
            movieTitleLabel.text = movieLandedOnCell.title
            movieDescriptionLabel.text = movieLandedOnCell.description
            
        }
    }

    // MARK: - Outlets
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
}
