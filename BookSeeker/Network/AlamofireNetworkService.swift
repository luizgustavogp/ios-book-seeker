//
//  AlamofireNetworkService.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 17/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireNetworkService: NetworkService {
    
    func get(url: String, parameters: [String : Any]?, completion: @escaping (BookResponse?, String?) -> Void) {
        AF.request(url, parameters: parameters)
            .responseDecodable(of: BookResponse.self) { response in
                switch response.result {
                case .success:
                    guard let bookResponse = response.value else { return }
                    completion(bookResponse, nil)
                case let .failure(error):
                    completion(nil, "Request failed with error: \(error)")
                }
        }
    }
}

