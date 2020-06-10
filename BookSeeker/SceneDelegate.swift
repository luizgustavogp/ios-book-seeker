//
//  SceneDelegate.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 16/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }

        let bookSeekerAssembler = BookSeekerAssembler()
        let assembler = bookSeekerAssembler.register()

        let navigationController = UINavigationController()

        let appCoordinator = AppCoordinator(navigationController: navigationController, resolver: assembler.resolver)
        appCoordinator.start()

        let win = UIWindow(windowScene: winScene)
        win.rootViewController = navigationController
        win.makeKeyAndVisible()
        window = win
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
