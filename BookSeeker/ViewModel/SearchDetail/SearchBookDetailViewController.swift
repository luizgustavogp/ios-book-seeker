//
//  SearchBookDetailViewController.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 19/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit
import RxSwift

class SearchBookDetailViewController: UIViewController {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbArtist: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    private var bookSearchDetailViewModel: BookSearchDetailViewModel?
    
    private let disposeBag = DisposeBag()
    
    public var id : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Injetar dependências
        let network : AlamofireNetworkService = AlamofireNetworkService()
        let bookServiceApi = BookSearchApiService(networkService: network)
        
        self.bookSearchDetailViewModel = BookSearchDetailViewModel(bookSearch: bookServiceApi)
        self.bookSearchDetailViewModel?.search(id: id);
        self.setupBookObserver()
    }
    
    func setupBookObserver() {
        self.bookSearchDetailViewModel?.bookObservable
            .subscribe(onNext: { response in
                
                if response.bookResponse?.resultCount == 0 {
                    self.alert(title: "alert".localized(), message: "book_not_found".localized());  return
                }
                
                guard let results = response.bookResponse?.results else { return }
                
                let book = results.first
                self.lbTitle.text = book?.trackName
                self.lbPrice.text = book?.formattedPrice
                self.lbArtist.text = book?.artistName
                self.lbDescription.text = book?.description
                
            }).disposed(by: disposeBag)
    }
}
