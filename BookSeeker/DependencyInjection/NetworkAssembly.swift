//
//  NetworkAssembly.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 01/05/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//


import Swinject
import BookSeekerDomain 
import BookSeekerInfrastructure

public class NetworkAssembly : Assembly{
    
    public func assemble(container: Container) {
        container.register(HttpGetService.self) {_ in
            return AlamofireHttpGetService()
        }
    }    
}
