//
//  NetworkService.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 17/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation


typealias RequestCompletion = (Result<Data?, Error>) -> Void

protocol NetworkService {    
    func get(url: URL, parameters: [String: Any]?, completion: @escaping RequestCompletion)
}
