//
//  BookSearchTextViewDelegate.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 29/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation

public protocol BookSearchTextViewDelegate: class {
     func didSearch(_ term: String)
}
