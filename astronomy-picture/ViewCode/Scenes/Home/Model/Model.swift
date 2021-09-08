//
//  AstronomyPicture.swift
//  ViewCode
//
//  Created by Gabriela Sillis on 31/08/21.
//

import Foundation


// MARK: - Result
struct AstronomyPicture: Decodable {
    let href: String?
    let explanation: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case explanation, title
        case href = "url"
    }
}
