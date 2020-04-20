//
//  FindBookViewModel.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 16/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation

final class BookSearchViewModel {
   
    func addSearch(term : String)  {
        
    }
    
    func termIsValid(term : String?) -> Bool {
        return  term != nil && term!.count > 0;
    }    
}
