//
//  FindBookViewController.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 16/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit

class BookSearchViewController: UIViewController {
    
    private var viewModelBookSearch: BookSearchViewModel!
    
    override func loadView() {
        super.loadView()
        
        self.view = BookSearchView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    init(viewModelBookSearch : BookSearchViewModel){
        
        self.viewModelBookSearch = viewModelBookSearch
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //if(!self.viewModelBookSearch.termIsValid(term: tfSearch.text))
    //        {
    //            self.alert(title: "book_search_title".localized(), message: "book_search_message");  return
    //        }
}


