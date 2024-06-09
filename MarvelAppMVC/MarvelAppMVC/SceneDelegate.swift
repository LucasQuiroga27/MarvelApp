//
//  SceneDelegate.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 26/05/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var mainCoordinator: MainCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        mainCoordinator = MainCoordinator(navigationController: navigationController)
                
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        mainCoordinator?.start()
        
    }

    


}

