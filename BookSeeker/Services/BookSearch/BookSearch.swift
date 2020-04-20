//
//  BookSearch.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 16/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation

typealias BookCompletion = (_ book: BookResponse?, _ errorMessage : String?) -> Void

protocol BookSearch {
    func findById(id : Int, completion: @escaping BookCompletion)
    func findByTerm(term : String, completion: @escaping BookCompletion)
}
