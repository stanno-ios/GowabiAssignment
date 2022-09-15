//
//  SceneDelegate.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/15/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let currentScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: currentScene)
        let initialVC = ContinueController()
        let navigationController = UINavigationController(rootViewController: initialVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

