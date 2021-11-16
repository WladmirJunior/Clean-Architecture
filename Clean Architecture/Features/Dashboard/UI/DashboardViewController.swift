//
//  DashboardViewController.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 12/11/21.
//

import UIKit
import Core

protocol DashboardViewControllerDelegate: AnyObject {
    func goToMovies(_ viewController: UIViewController)
}

class DashboardViewController: UIViewController {

    private lazy var module1: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Filmes", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(navigate(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var module2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Outros 1", for: .normal)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(navigate(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var module3: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Outros 2", for: .normal)
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(navigate(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.height(100)
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    public weak var delegate: DashboardViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc private func navigate(sender: UIButton) {
        switch sender {
        case module1:
            delegate?.goToMovies(self)
        case module2, module3: break
        default: break
        }
    }
    
    private func setup() {
        setupUI()
        buildViewHierarchy()
        addConstraints()
    }
    
    private func setupUI() {
        title = "Dash"
        view.backgroundColor = .white
    }
    
    private func buildViewHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(module1)
        stackView.addArrangedSubview(module2)
        stackView.addArrangedSubview(module3)
    }
    
    private func addConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        stackView.topTo(safeArea.topAnchor)
            .leadingTo(view.leadingAnchor, constant: Metrics.medium)
            .trailingTo(view.trailingAnchor, constant: Metrics.medium)
    }
}
