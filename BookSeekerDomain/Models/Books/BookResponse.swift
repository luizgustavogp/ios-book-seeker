//
//  BookResponse.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 17/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation

public struct BookResponse: Decodable {
   public let resultCount: Int
   public let results: [Book]
}
