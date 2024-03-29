//
//  StartViewController.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import UIKit
import Core

protocol StartViewControllerDelegate: AnyObject {
    func goNext(_ viewController: UIViewController)
}

class StartViewController: UIViewController {

    enum Constants {
        static let buttonTitle = "Iniciar"
        static let subtitle = "Tela de login ou onboarding..."
    }

    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    private lazy var movieImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = .movies
        imageView.tintColor = .purple
        return imageView
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = Constants.subtitle
        return label
    }()

    private lazy var centerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(clickToExplore), for: .touchUpInside)
        return button
    }()

    weak var delegate: StartViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - UI

    private func setup() {
        setupUI()
        buildViewHierarchy()
        addConstraints()
    }

    private func setupUI() {
        view.backgroundColor = .white
    }

    private func buildViewHierarchy() {
        view.addSubview(contentView)
        contentView.addSubview(movieImage)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(centerButton)
    }

    private func addConstraints() {

        contentView.centerYTo(view.centerYAnchor)
            .centerXTo(view.centerXAnchor)
            .leadingTo(view.leadingAnchor)
            .trailingTo(view.trailingAnchor)

        movieImage.topTo(contentView.topAnchor)
            .centerXTo(contentView.centerXAnchor)

        subtitleLabel.topTo(movieImage.bottomAnchor, constant: Metrics.small)
            .leadingTo(contentView.leadingAnchor, constant: Metrics.big)
            .trailingTo(contentView.trailingAnchor, constant: Metrics.big)

        centerButton.centerXTo(contentView.centerXAnchor)
            .topTo(subtitleLabel.bottomAnchor, constant: Metrics.big)
            .bottomTo(contentView.bottomAnchor)
    }

    // MARK: - ACTIONS

    @objc private func clickToExplore() {
        delegate?.goNext(self)
    }
}
