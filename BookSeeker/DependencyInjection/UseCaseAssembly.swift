//
//  UseCaseAssembly.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 01/05/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Swinject
import BookSeekerDomain
import BookSeekerApplication
import BookSeekerPresenter

public final class UseCaseAssembly: Assembly {

    public func assemble(container: Container) {

        container.register(BookSearchViewModel.self) {_ in
            return BookSearchViewModel()
        }

        container.register(BookSearchViewController.self) { resolver in
            let bookSearchViewModel = resolver.resolve(BookSearchViewModel.self)!
            return BookSearchViewController(viewModelBookSearch: bookSearchViewModel)
        }

        container.register(BookSearchResultViewModel.self) {resolver in
            let bookSearchApi = resolver.resolve(BookSearchService.self)!
            return BookSearchResultViewModel(bookSearch: bookSearchApi)
        }

        container.register(BookSearchResultViewController.self) { (resolver, term: String) in
            let bookSearchResultViewModel = resolver.resolve(BookSearchResultViewModel.self)!
            return BookSearchResultViewController(bookSearchResultViewModel: bookSearchResultViewModel, term: term)
        }

        container.register(BookSearchDetailViewModel.self) {resolver in
            let bookSearchApi = resolver.resolve(BookSearchService.self)!
            return BookSearchDetailViewModel(bookSearch: bookSearchApi)
        }

        container.register(BookSearchDetailViewController.self) { (resolver, bookId: Int) in
            let bookSearchDetailViewModel = resolver.resolve(BookSearchDetailViewModel.self)!
            return BookSearchDetailViewController(bookSearchDetailViewModel: bookSearchDetailViewModel, bookId: bookId)
        }
    }
}
