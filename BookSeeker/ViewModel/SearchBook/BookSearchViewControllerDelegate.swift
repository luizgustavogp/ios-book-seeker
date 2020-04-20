//
//  SearchBookViewControllerDelegate.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 18/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation
import UIKit


public protocol BookSearchViewControllerDelegate  {
    
    func didSearch( _  term: String)
}
