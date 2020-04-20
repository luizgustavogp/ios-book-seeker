//
//  SearchResultViewController.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 18/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit
import RxSwift

class BookSearchResultViewController: UITableViewController  {
    
    @IBOutlet var table: UITableView!
    
    private var bookSearchResultViewModel: BookSearchResultViewModel?
    
    public var term : String!
    
    private var books : [Book]?
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Injetar dependência
        let network : AlamofireNetworkService = AlamofireNetworkService()
        let bookServiceApi = BookSearchApiService(networkService: network)
        self.bookSearchResultViewModel = BookSearchResultViewModel(bookSearch: bookServiceApi)
        self.bookSearchResultViewModel?.search(term: self.term)
        self.setupBookObserver()
    }
    
    func setupBookObserver() {
        self.bookSearchResultViewModel?.bookObservable
            .subscribe(onNext: { response in
                
                if response.bookResponse?.resultCount == 0 {
                    self.alert(title: "alert".localized(), message: "book_not_found".localized());  return
                }
                
                guard let results = response.bookResponse?.results else { return }
                self.books = results
                self.table.reloadData()
                
            }).disposed(by: disposeBag)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.books?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reusableBookCell", for: indexPath)
            as? BookCell else {
                return UITableViewCell()
        }
        
        cell.configureCell(rowBook: self.books?[indexPath.row])
        
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = self.books?[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SearchBookDetailViewController") as UIViewController
        let searchBookDetailViewController = viewController as! SearchBookDetailViewController
        
        searchBookDetailViewController.id = book?.trackId;
        
        self.present(searchBookDetailViewController, animated: true, completion: nil)            
    }
}


