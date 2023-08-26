//
//  MoviesTableViewCell.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    static var identifier: String = "MoviesCell"
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        ratingLabel.text = ""
        popularityLabel.text = ""
        posterImageView.image = nil
    }
}

extension MoviesTableViewCell {
    func update(with movie: Movie) {
        titleLabel.text = movie.title
        ratingLabel.text = "Rating \(movie.voteAverage)"
        popularityLabel.text = "Popularity \(movie.popularity)"
        let imageURLString = Constants.imageBaseURL + (movie.posterPath ?? "")
        posterImageView.setImage(from: imageURLString, placeholderImage: UIImage(named: "movie"))
    }
}
