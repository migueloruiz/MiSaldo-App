//
//  SceneDelegate.swift
//  DealStack
//
//  Created by Guilherme Rambo on 03/07/19.
//  Copyright © 2019 Guilherme Rambo. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    lazy var store = HomeStore()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(
                rootView: HomeView(actions: store.actions, state: store.state)
            )
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

