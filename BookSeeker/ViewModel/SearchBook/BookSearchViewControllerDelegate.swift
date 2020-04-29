//
//  SearchBookViewControllerDelegate.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 18/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation

public protocol BookSearchViewControllerDelegate : class {    
    func didSearch(_ term: String)
}
