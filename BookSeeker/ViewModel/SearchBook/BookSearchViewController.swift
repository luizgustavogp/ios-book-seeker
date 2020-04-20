//
//  FindBookViewController.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 16/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit

class BookSearchViewController: UIViewController {
    
    @IBOutlet weak var tfSearch: UITextField!
    
    private var viewModelBookSearch: BookSearchViewModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModelBookSearch = BookSearchViewModel()
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        
        if(!self.viewModelBookSearch.termIsValid(term: tfSearch.text))
        {
            self.alert(title: "book_search_title".localized(), message: "book_search_message");  return
        }
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard
            .instantiateViewController(withIdentifier: "BookSearchResultViewController") as UIViewController
        
        let bookSearchResultViewController = viewController as! BookSearchResultViewController
        bookSearchResultViewController.term = tfSearch.text
        
        self.present(bookSearchResultViewController, animated: true, completion: nil)
    }
}


