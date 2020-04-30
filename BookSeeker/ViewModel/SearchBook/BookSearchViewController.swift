//
//  FindBookViewController.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 16/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit

final class BookSearchViewController: CustomViewController<BookSearchView> {
    
    private var viewModelBookSearch: BookSearchViewModel!
    
    //Why it can't be weak?
    var bookSearchViewControllerDelegate : BookSearchViewControllerDelegate?
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.customView.searchDeletegate = self
    }
    
    init(viewModelBookSearch : BookSearchViewModel){
        
        self.viewModelBookSearch = viewModelBookSearch
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookSearchViewController : BookSearchTextViewDelegate {
    func didSearch(_ term: String) {
        
        if(!self.viewModelBookSearch.termIsValid(term: term))
        {
            self.alert(title: "book_search_title".localized(), message: "book_search_message".localized());  return
        }
        
        self.bookSearchViewControllerDelegate?.didSearch(term)
    }
}



