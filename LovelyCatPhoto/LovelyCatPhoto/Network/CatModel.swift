//
//  CatModel.swift
//  LovelyCatPhoto
//
//  Created by Hertz on 9/2/22.
//

import Foundation

// MARK: - WelcomeElement
struct CatImageData: Codable {
    let breeds: [Breed]?
    let id: String?
    let url: String?

}

// MARK: - Breed
struct Breed: Codable {
    let id: String?
    let name: String?
    let lifeSpan: String?
    let childFriendly: Int?
    let energyLevel: Int?
    let intelligence: Int?
    let strangerFriendly: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case lifeSpan = "life_span"
        case childFriendly = "child_friendly"
        case intelligence
        case strangerFriendly = "stranger_friendly"
        case energyLevel
    }
}





