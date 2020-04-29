//
//  AppCoordinator.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 29/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController{ get set }
    
    func start()
}

class AppCoordinator : Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let bookViewModel = BookSearchViewModel()
        let rootViewController = BookSearchViewController(viewModelBookSearch: bookViewModel)
        
        self.navigationController.pushViewController(rootViewController, animated: true)
    }
}
