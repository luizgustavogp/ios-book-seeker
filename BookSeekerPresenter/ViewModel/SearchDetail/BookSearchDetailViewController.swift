//
//  BookSearchDetailViewController.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 19/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit
import RxSwift

public class BookSearchDetailViewController: CustomViewController<BookSearchDetailView> {
    
    private var bookSearchDetailViewModel: BookSearchDetailViewModel?
    
    private let disposeBag = DisposeBag()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public init(bookSearchDetailViewModel : BookSearchDetailViewModel, bookId : Int) {
        super.init(nibName: nil, bundle: nil)
        
        self.bookSearchDetailViewModel = bookSearchDetailViewModel
        self.bookSearchDetailViewModel?.search(id: bookId);
        self.setupBookObserver()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBookObserver() {
        self.bookSearchDetailViewModel?.bookObservable
            .subscribe(onNext: { response in
                if response.bookResponse?.resultCount == 0 {
                    self.alert(title: "alert".localized(), message: "book_not_found".localized());  return
                }
                guard let results = response.bookResponse?.results else { return }
                
                self.customView.configure(rowBook: results.first)
                
            }).disposed(by: disposeBag)
    }
}
