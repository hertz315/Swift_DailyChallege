//
//  Movie.swift
//  findMyMovie
//
//  Created by Hertz on 8/29/22.
//

import Foundation

// MARK: - Welcome
struct MovieData: Codable {
    let items: [Movie]
}

// MARK: - Item
struct Movie: Codable {
    let title: String?
    let image: String?
    let actor: String?
    let director: String?
    let userRating: String?
}
