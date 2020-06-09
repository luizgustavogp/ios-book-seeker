//
//  SearchResultViewController.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 18/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit
import RxSwift
import BookSeekerDomain

public class BookSearchResultViewController: UITableViewController  {
    
    private let ceelIdentitier = "reusableBookCell";
    
    private var bookSearchResultViewModel: BookSearchResultViewModel?
    
    private var books : [Book]?
    
    private let disposeBag = DisposeBag()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "book_search_result_view_title".localized()
        tableView.rowHeight = 120
        tableView.register(BookCell.self, forCellReuseIdentifier: ceelIdentitier)
    }
    
    public init(bookSearchResultViewModel : BookSearchResultViewModel, term : String){
        super.init(nibName: nil, bundle: nil)
        
        self.bookSearchResultViewModel = bookSearchResultViewModel
        self.bookSearchResultViewModel?.search(term: term)
        self.setupBookObserver()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBookObserver() {
        self.bookSearchResultViewModel?.bookObservable
            .subscribe(onNext: { response in
                
                if response.bookResponse?.resultCount == 0 {
                    self.alert(title: "alert".localized(), message: "book_not_found".localized());  return
                }
                
                guard let results = response.bookResponse?.results else { return }
                self.books = results
                self.tableView.reloadData()
                
            }).disposed(by: disposeBag)
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.books?.count ?? 0
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ceelIdentitier, for: indexPath)
            as? BookCell else {
                return UITableViewCell()
        }
        
        cell.configureCell(rowBook: self.books?[indexPath.row])
        
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let book = self.books?[indexPath.row]
    }
}


