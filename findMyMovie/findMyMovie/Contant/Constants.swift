//
//  Constans.swift
//  findMyMovie
//
//  Created by Hertz on 8/29/22.
//

// 0
import UIKit

enum Client {
    static let clientID = "hyoK6H4wg4tQeDsnIYBN"
    static let clientKEY = "Vs2xvRT5oj"
}

enum MovieApi {
    static let requestUrl = "https://openapi.naver.com/v1/search/movie.json?query="
}

enum Cell {
    static let movieCellIdentifier = "MovieCell"
    static let movieCollectionViewCellIdentifier = "MovieCollectionViewCell"
}

enum CVCell {
    static let spacingWidth: CGFloat = 1
    static let cellColumns: CGFloat = 3
}
