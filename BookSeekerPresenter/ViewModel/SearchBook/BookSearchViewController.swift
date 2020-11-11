//
//  FindBookViewController.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 16/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit

public final class BookSearchViewController: CustomViewController<BookSearchView> {
    private var viewModelBookSearch: BookSearchViewModel!
    
    public var delegate: BookSearchViewControllerDelegate?

    public override func loadView() {
        super.loadView()
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "book_search_view_title".localized()
    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.customView.delegate = self
    }
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    public init(viewModelBookSearch: BookSearchViewModel) {
        self.viewModelBookSearch = viewModelBookSearch
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookSearchViewController: BookSearchTextViewDelegate {
    public func didSearch(_ term: String) {

        if !self.viewModelBookSearch.termIsValid(term: term) {
            self.alert(title: "book_search_title".localized(), message: "book_search_message".localized());  return
        }

        self.delegate?.didSearch(term)
    }
}
