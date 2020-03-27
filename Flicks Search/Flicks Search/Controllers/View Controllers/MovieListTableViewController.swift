//
//  MovieListTableViewController.swift
//  Flicks Search
//
//  Created by theevo on 3/13/20.
//  Copyright © 2020 Theo Vora. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var movies: [Movie] = []
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        
        return cell
    }
    

    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    

} // end class


extension MovieListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        
        MovieController.fetchMovies(searchTerm: searchText) { (result) in
            switch result {
                
            case .success(let movieArray):
                DispatchQueue.main.async {
                    self.movies = movieArray
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error, error.localizedDescription)
            } // end switch
        }// end fetchMovies
    } // end func
} // end extension
