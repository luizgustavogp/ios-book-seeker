//
//  SearchBookResultViewModel.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 18/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import Foundation
import RxSwift

final class BookSearchResultViewModel {
    
    private var bookSearch : BookSearch?;
    
    let bookObservable = PublishSubject<BookViewModelCompletion>()
    
    init(bookSearch : BookSearch) {
        self.bookSearch = bookSearch;
    }
    
    func search(term: String) {
        self.bookSearch?.findByTerm(term :"Teste"){ response, error in
            self.bookObservable.onNext((response, error))
        }
    }
}

