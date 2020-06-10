//
//  Assembler.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 01/05/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Swinject

//https://github.com/Swinject/Swinject/blob/master/Documentation/Assembler.md

class BookSeekerAssembler {

    func register() -> Assembler {

        let assembler = Assembler([
            NetworkAssembly(),
            ServiceAssembly(),
            UseCaseAssembly()
        ])
        return assembler
    }
}
