//
//  SceneDelegate.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/08/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    lazy var store = HomeStore()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(
            rootView: HomeView(actions: store.actions, state: store.state)
        )
        self.window = window
        window.makeKeyAndVisible()
    }
}

