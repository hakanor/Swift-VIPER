//
//  SceneDelegate.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let homeViewController = HomeModuleBuilder().build()
        window?.rootViewController = UINavigationController(rootViewController: homeViewController)
        window?.makeKeyAndVisible()
        
    }
}

