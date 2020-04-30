//
//  AppCoordinator.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 29/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit
import Swinject

protocol Coordinator {
    
    var container : Container {get set}
    
    var navigationController: UINavigationController{ get set }
    
    func start()
}

public class AppCoordinator : Coordinator {
    
    var container: Container
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, container : Container) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func start() {
        
        let rootViewController = container.resolve(BookSearchViewController.self)!
        rootViewController.bookSearchViewControllerDelegate = self
        
        self.navigationController.pushViewController(rootViewController, animated: true)
    }
}


extension AppCoordinator : BookSearchViewControllerDelegate{
    public func didSearch(_ term: String) {
        let network : AlamofireNetworkService = AlamofireNetworkService()
        let bookServiceApi = BookSearchApiService(networkService: network)
        let bookSearchResultViewModel = BookSearchResultViewModel(bookSearch: bookServiceApi)
        let bookSearchResultViewController = BookSearchResultViewController(bookSearchResultViewModel: bookSearchResultViewModel, term: term)
        self.navigationController.pushViewController(bookSearchResultViewController, animated: true)
    }
}
