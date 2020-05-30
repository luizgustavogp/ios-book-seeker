//
//  Book.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 16/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation


struct Book : Model {
    
    let trackId: Int
    let trackName: String
    let description: String
    let artistName: String
    let artistViewUrl: String
    let artworkUrl100: String
    let formattedPrice: String
    let averageUserRating: Double?
    let price: Double?
    let genres: [String]
}
