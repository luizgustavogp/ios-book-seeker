//
//  SearchBookResultViewModel.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 18/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation
import RxSwift
import BookSeekerDomain
import BookSeekerApplication



final class BookSearchResultViewModel {
    
    private var bookSearch : BookSearchService?;
    
    let bookObservable = PublishSubject<BookViewModelCompletion>()
    
    init(bookSearch : BookSearchService) {
        self.bookSearch = bookSearch;
    }
    
    func search(term: String) {
        self.bookSearch?.findByTerm(term :term){ response, error in
            self.bookObservable.onNext((response, error))
        }
    }
}

