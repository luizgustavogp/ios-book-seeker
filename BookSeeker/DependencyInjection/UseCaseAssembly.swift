//
//  UseCaseAssembly.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 01/05/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Swinject

public final class UseCaseAssembly : Assembly{
    
    public func assemble(container: Container) {
        
        container.register(BookSearchViewModel.self) {_ in
            return BookSearchViewModel()
        }
        
        container.register(BookSearchViewController.self) { r in
            let bookSearchViewModel = r.resolve(BookSearchViewModel.self)!
            return BookSearchViewController(viewModelBookSearch: bookSearchViewModel)
        }
        
        container.register(BookSearchResultViewModel.self) {r in
            let bookSearchApi = r.resolve(BookSearch.self)!
            return BookSearchResultViewModel(bookSearch: bookSearchApi)
        }
        
        container.register(BookSearchResultViewController.self) { (r, term: String) in
            let bookSearchResultViewModel = r.resolve(BookSearchResultViewModel.self)!
            return BookSearchResultViewController(bookSearchResultViewModel :bookSearchResultViewModel, term: term)
        }
        
        container.register(BookSearchDetailViewModel.self) {r in
            let bookSearchApi = r.resolve(BookSearch.self)!
            return BookSearchDetailViewModel(bookSearch: bookSearchApi)
        }
        
        container.register(BookSearchDetailViewController.self) { (r, bookId: Int) in
            let bookSearchDetailViewModel = r.resolve(BookSearchDetailViewModel.self)!
            return BookSearchDetailViewController(bookSearchDetailViewModel: bookSearchDetailViewModel, bookId: bookId)
        }
    }
}
