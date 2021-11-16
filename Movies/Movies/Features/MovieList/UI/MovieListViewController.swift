//
//  MovieListViewController.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import UIKit
import Core

protocol MovieListViewControllerDelegate: AnyObject {
    func goToMovieDetail(_ viewController: UIViewController, movie: Movie)
}

protocol MovieListViewControllerType: AnyObject {
    func updateMovies(with movies: [Movie])
}

class MovieListViewController: UIViewController {

    enum Constants {
        static let tileBar = "Inter Movies"
        static let serachButtonTitle = "Pesquisar"
    }
    
    public var viewModel: MovieListViewModelType?
    
    public init(viewModel: MovieListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private lazy var stackView: UIStackView = {
        let scrollView = UIStackView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.axis = .vertical
        return scrollView
    }()

    private lazy var tableView: AutoSizingTableView = {
        let tableView = AutoSizingTableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel?.initState()
    }

    weak var delegate: MovieListViewControllerDelegate?
    let searchController = UISearchController(searchResultsController: nil)
    var movies: [Movie] = []
    var filteredMovies: [Movie] = []
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }

    // MARK: - UI

    private func setup() {
        setupUI()
        buildViewHierarchy()
        addConstraints()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = Constants.tileBar

        tableView.dataSource = self
        tableView.delegate = self

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Constants.serachButtonTitle
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    private func buildViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(tableView)
    }

    private func addConstraints() {
        scrollView.constraintToSuperview()
        contentView.constraintToSuperview()

        contentView.width(view.widthAnchor)
        let contentViewHeightConstant = contentView.heightAnchor.constraint(equalTo: view.heightAnchor)
        contentViewHeightConstant.priority = .defaultLow
        contentViewHeightConstant.isActive = true

        stackView.leadingTo(contentView.leadingAnchor, constant: Metrics.medium)
            .trailingTo(contentView.trailingAnchor, constant: Metrics.medium)
    }

    private func filterContentForSearchText(_ searchText: String) {
        filteredMovies = movies.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
}

extension MovieListViewController: MovieListViewControllerType {
    func updateMovies(with movies: [Movie]) {
        self.movies = movies
        tableView.reloadData()
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredMovies.count
        }
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie: Movie
        if isFiltering {
            movie = filteredMovies[indexPath.row]
        } else {
            movie = movies[indexPath.row]
        }
        let cell = UITableViewCell()
        cell.textLabel?.text = movie.title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie: Movie
        if isFiltering {
            movie = filteredMovies[indexPath.row]
        } else {
            movie = movies[indexPath.row]
        }
        delegate?.goToMovieDetail(self, movie: movie)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MovieListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
