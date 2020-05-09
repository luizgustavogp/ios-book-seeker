//
//  BookResponse.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 17/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation


struct BookResponse : Decodable {
    let resultCount : Int
    let results : [Book]
}
