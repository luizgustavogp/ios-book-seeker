//
//  ServiceAssembly.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 01/05/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//


import Swinject

public final class ServiceAssembly : Assembly{
    
    public func assemble(container: Container) {
        container.register(BookSearch.self) {r  in
            let networkService = r.resolve(NetworkService.self)!
            return BookSearchApiService(networkService: networkService)
        }
    }
}
