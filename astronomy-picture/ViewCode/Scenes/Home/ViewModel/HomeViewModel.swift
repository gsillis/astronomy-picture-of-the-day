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

    private var apiKey: String {
        guard let filePath = Bundle.main.path(forResource: "API_KEY", ofType: "plist") else {
            fatalError("Couldn't find file 'API_KEY'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_KEY' in 'API_KEY.plist'.")
        }
        return value
    }

    public func getData() {
        let path = "https://api.nasa.gov/planetary/apod?api_key=%@"
        let formatURL = String(format: path, apiKey)

        if let urlPath = URL(string: formatURL) {
            AF.request(urlPath).responseJSON { response in
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
