//
//  ServiceAssembly.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 01/05/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Swinject
import BookSeekerDomain
import BookSeekerApplication
import BookSeekerInfrastructure

public final class ServiceAssembly: Assembly {

    public func assemble(container: Container) {
        container.register(BookSearchService.self) {result  in
            let httpGetService = result.resolve(HttpGetService.self)!
            return BookSearchService(networkService: httpGetService)
        }
    }
}
