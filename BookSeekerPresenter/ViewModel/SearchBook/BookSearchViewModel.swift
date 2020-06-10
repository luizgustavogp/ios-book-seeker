//
//  FindBookViewModel.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 16/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation

public final class BookSearchViewModel {

    public init() {
    }

    func addSearch(term: String) {
    }

    func termIsValid(term: String?) -> Bool {
        return  term != nil && term!.count > 0
    }
}
