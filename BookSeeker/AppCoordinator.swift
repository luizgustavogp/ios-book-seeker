//
//  AppCoordinator.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 29/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit
import Swinject
import BookSeekerDomain
import BookSeekerApplication
import BookSeekerInfrastructure
import BookSeekerPresenter

protocol Coordinator {
    
    var resolver : Resolver {get set}
    
    var navigationController: UINavigationController{ get set }
    
    func start()
}

public class AppCoordinator : Coordinator {
    
    var resolver: Resolver
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, resolver : Resolver) {
        self.navigationController = navigationController
        self.resolver = resolver
    }
    
    func start() {
        
        let rootViewController = resolver.resolve(BookSearchViewController.self)!
        rootViewController.bookSearchViewControllerDelegate = self
              
        self.navigationController.pushViewController(rootViewController, animated: true)
    }
}


extension AppCoordinator : BookSearchViewControllerDelegate{
    public func didSearch(_ term: String) {
        let network : AlamofireHttpGetService = AlamofireHttpGetService()
        let bookServiceApi = BookSearchService(networkService: network)
        let bookSearchResultViewModel = BookSearchResultViewModel(bookSearch: bookServiceApi)
        let bookSearchResultViewController = BookSearchResultViewController(bookSearchResultViewModel: bookSearchResultViewModel, term: term)
        
        self.navigationController.pushViewController(bookSearchResultViewController, animated: true)
    }
}
