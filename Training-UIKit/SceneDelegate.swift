//
//  SceneDelegate.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 23..
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    private lazy var appController: AppController = {
        let appController = AppController(resolver: AppComposition.composeAssembler().resolver)
        return appController
    }()
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        window.overrideUserInterfaceStyle = .unspecified
        appController.start(in: window, load: true)
        Log.debug("Started")

        self.window = window
    }
}
