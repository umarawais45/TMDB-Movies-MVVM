//
//  MovieDetailViewController.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import UIKit
import Combine

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var viewModel: MovieDetailViewModel!
    private var subscribers: [AnyCancellable] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        viewModel.fetchMovieDetails()
    }
}

extension MovieDetailViewController {
    func bindView() {
        viewModel.$title.sink { [weak self] title in
            self?.titleLabel.text = title
        }.store(in: &subscribers)
        
        viewModel.$imagePath.sink { [weak self] imagePath in
            let imageURLString = Constants.imageBaseURL + imagePath
            self?.posterImageView.setImage(from: imageURLString)
        }.store(in: &subscribers)
        
        viewModel.$description.sink { [weak self] description in
            self?.descriptionLabel.text = description
        }.store(in: &subscribers)
    }
}

