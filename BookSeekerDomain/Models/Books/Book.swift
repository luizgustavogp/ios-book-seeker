//
//  Book.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 16/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation

public struct Book: Model {

    public let trackId: Int
    public let trackName: String
    public let description: String
    public let artistName: String
    public let artistViewUrl: String
    public let artworkUrl100: String
    public let formattedPrice: String
    public let averageUserRating: Double?
    public let price: Double?
    public let genres: [String]
}
