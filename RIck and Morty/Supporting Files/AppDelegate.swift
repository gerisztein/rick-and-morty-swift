//
//  AppDelegate.swift
//  RIck and Morty
//
//  Created by Lucas Gerisztein on 09.03.20.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let navigationController = UINavigationController()
    let router = CharacterListRouter(navigationController: navigationController)
    let viewModel = CharacterListViewModel(router: router)
    let rootViewController = CharacterListViewController(viewModel: viewModel)
    navigationController.viewControllers = [rootViewController]
    
    navigationController.navigationBar.barTintColor = .lightGray
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    
    return true
  }
}

