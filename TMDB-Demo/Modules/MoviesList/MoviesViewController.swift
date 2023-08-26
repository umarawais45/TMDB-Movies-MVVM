//
//  MoviesViewController.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import UIKit
import Combine

class MoviesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: MoviesViewModel!
    var router: MoviesRouter!
    private var subscribers: [AnyCancellable] = []
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableView()
        bindViews()
        fetchMovies()
    }
}

extension MoviesViewController {
    private func configureTableView() {
        let nib = UINib.init(nibName: "MoviesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MoviesTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func bindViews() {
        viewModel.$movies.sink { [weak self] movies in
            DispatchQueue.main.async {
                self?.movies = movies
                self?.updateView()
            }
        }.store(in: &subscribers)
    }

    private func fetchMovies() {
        activityIndicator.startAnimating()
        viewModel.fetchMovies()
    }

    private func updateView() {
        activityIndicator.stopAnimating()
        tableView.reloadData()
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier) as! MoviesTableViewCell
        cell.update(with: self.movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.routeToMovieDetails(movie: self.movies[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
