//
//  NetworkService.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 17/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation


typealias RequestCompletion = (_ result : BookResponse?, _ error: String?) -> Void

protocol NetworkService {
    
    func get(url: String, parameters: [String: Any]?, completion: @escaping RequestCompletion)
}
