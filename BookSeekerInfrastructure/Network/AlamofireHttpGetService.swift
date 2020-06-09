//
//  AlamofireNetworkService.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 17/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation
import Alamofire
import BookSeekerDomain

public class AlamofireHttpGetService: HttpGetService {
    
    public init() {}
       
    public func get(url: URL, parameters: [String : Any]?, completion: @escaping RequestCompletion) {
        AF.request(url, parameters: parameters)
            .responseData { response in
                switch response.result {
                case .success:
                    guard let result = response.value else { return }
                    completion(.success(result))
                case let .failure(error):
                    completion(.failure(error))
                }
        }
    }
}

