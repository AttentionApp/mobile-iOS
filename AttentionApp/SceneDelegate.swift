//
//  SceneDelegate.swift
//  AttentionApp
//
//  Created by Ricardo Guevara on 11/3/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
    let rootView = LogInView()

    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(rootView: rootView.environmentObject(GlobalState()))
      self.window = window
      window.makeKeyAndVisible()
    }
  }

  func sceneDidDisconnect(_: UIScene) {}

  func sceneDidBecomeActive(_: UIScene) {}

  func sceneWillResignActive(_: UIScene) {}

  func sceneWillEnterForeground(_: UIScene) {}

  func sceneDidEnterBackground(_: UIScene) {}
}
