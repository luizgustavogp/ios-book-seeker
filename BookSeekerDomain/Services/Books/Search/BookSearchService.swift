//  BookSearchService.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 16/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation

public class BookSearchService {

    private let networkService: HttpGetService

    private let apiEndPoint: (String) -> URL = { (path: String) -> URL in
        guard let url = URL(string: "https://itunes.apple.com/\(path)") else {
            fatalError("Invalid apiEndPoint.")
        }
        return url
    }

    public init(networkService: HttpGetService) {
        self.networkService = networkService
    }

    public func findByTerm(term: String, completion: @escaping BookCompletion) {
        self.get(url: apiEndPoint("search"), parameters: ["term": term, "entity": "ibook"], with: completion)
    }

    public func findById(bookId: Int, completion: @escaping BookCompletion) {
        self.get(url: apiEndPoint("lookup"), parameters: ["id": bookId], with: completion)
    }
}

extension BookSearchService {

    private func get(url: URL, parameters: [String: Any], with completion: @escaping BookCompletion) {
        self.networkService.get(url: url, parameters: parameters) { result in
            switch result {
            case .success(let data):
                completion(data?.toModel(), nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
