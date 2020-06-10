//
//  ModelBase.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 17/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation

public protocol Model: Codable {  }

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

public extension Data {
    func toModel<M: Decodable>() -> M? {
        return try? JSONDecoder().decode(M.self, from: self)
    }
}
