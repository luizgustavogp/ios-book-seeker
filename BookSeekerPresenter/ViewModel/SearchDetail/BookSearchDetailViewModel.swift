//
//  SearchBookDetailViewModel.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 19/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import RxSwift
import Foundation
import BookSeekerDomain
import BookSeekerApplication

public final class BookSearchDetailViewModel {

    private var bookSearch: BookSearchService?

    let bookObservable = PublishSubject<BookViewModelCompletion>()

    public init(bookSearch: BookSearchService) {
        self.bookSearch = bookSearch
    }

    func search(bookId: Int) {
        self.bookSearch?.findById(bookId: bookId) { response, error in
            self.bookObservable.onNext((response, error))
        }
    }
}
