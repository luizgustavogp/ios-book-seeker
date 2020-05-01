//  BookSearchService.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 16/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation

public final class BookSearchApiService : BookSearch {
    
    private let networkService : NetworkService
    
    private let apiEndPoint:(String) -> String = { (path:String) -> String in
        guard let url = URL(string: "https://itunes.apple.com/\(path)") else {
            fatalError("Invalid apiEndPoint.")
        }
        return url.absoluteString
    }
    
    init(networkService : NetworkService) {
        self.networkService = networkService
    }
    
    func findByTerm(term: String, completion: @escaping BookCompletion) {
        let parameters: [String: Any] = ["term": term, "entity": "ibook"]
        
        self.networkService.get(url:apiEndPoint("search"), parameters: parameters) { response, error in
            completion(response, error)
        }
    }
    
    func findById(id: Int, completion: @escaping BookCompletion) {
        let parameters: [String: Int] = ["id": id]
        
        self.networkService.get(url:apiEndPoint("lookup"), parameters: parameters){ response, error in
            completion(response, error)
        }
    }
}

