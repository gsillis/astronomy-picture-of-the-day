//
//  HomeVC.swift
//  ViewCode
//
//  Created by Gabriela Sillis on 30/08/21.
//

import UIKit

class HomeVC: UIViewController {

    // MARK: - Private properties

    private var homeScreen: HomeScreen?
    private var viewModel = HomeViewModel()

    // MARK: - View Lifecycle

    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getData()
        self.viewModel.delegate = self
    }
}

// MARK: - HomeViewModelProtocol

extension HomeVC: HomeViewModelProtocol {
    func success(data: AstronomyPicture) {
        self.homeScreen?.config(with: data)
    }

    func failure(error: Error) {
        // implementar
    }
}
