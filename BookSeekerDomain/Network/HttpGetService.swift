//
//  NetworkService.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 17/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation

public protocol HttpGetService {    
    func get(url: URL, parameters: [String: Any]?, completion: @escaping RequestCompletion)
}
