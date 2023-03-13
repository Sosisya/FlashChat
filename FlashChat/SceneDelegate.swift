//
//  SceneDelegate.swift
//  FlashChat
//
//  Created by Луиза Самойленко on 12.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

     func scene(_ scene: UIScene,
                willConnectTo session: UISceneSession,
                options connectionOptions: UIScene.ConnectionOptions) {

         guard let windowScene = (scene as? UIWindowScene) else { return }
         let window = UIWindow(windowScene: windowScene)
         let navController = UINavigationController()
         navController.viewControllers = [WelcomeViewController()]
         window.rootViewController = navController
         self.window = window
         window.makeKeyAndVisible()
     }
}

