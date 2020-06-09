//
//  RequestCompletion.swift
//  BookSeekerDomain
//
//  Created by Luiz Guimarães on 30/05/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation

public typealias RequestCompletion = (Result<Data?, Error>) -> Void
