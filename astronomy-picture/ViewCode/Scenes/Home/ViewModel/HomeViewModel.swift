//
//  HomeViewModel.swift
//  ViewCode
//
//  Created by Gabriela Sillis on 31/08/21.
//

import Foundation
import Alamofire

// MARK: - HomeViewModelProtocol
protocol HomeViewModelProtocol: AnyObject {
    func success(data: AstronomyPicture)
    func failure(error: Error)
}

// MARK: - HomeViewModel
class HomeViewModel {

    weak var delegate: HomeViewModelProtocol?

    // MARK: - Public func

    public func delegate(delegate: HomeViewModelProtocol) {
        self.delegate = delegate
    }

    public func getData() {
        let path: String = "https://api.nasa.gov/planetary/apod?api_key="
        if let path = URL(string: path) {
            AF.request(path).responseJSON { response in
                if let data = response.data {
                    do {
                        let result: AstronomyPicture = try JSONDecoder().decode(AstronomyPicture.self, from: data)
                        self.delegate?.success(data: result)
                    } catch {
                        self.delegate?.failure(error: error)
                    }
                }
            }
        }
    }
}
