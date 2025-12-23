//
//  AppDelegate.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 07..
//

import UIKit
import Swinject
import Toolkit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private lazy var appController: AppController = {
        let appController = AppController(resolver: AppComposition.composeAssembler().resolver)
        return appController
    }()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        Log.install(ToolkitLoggerAdapter())
//        AppleLoggerAdapter.bootstrapStandardOutputWithLogLevel(level: .trace)
//        Log.install(AppleLoggerAdapter())
        
        return true
    }

    // Scene support (iOS 13+)
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration
    {
        let config = UISceneConfiguration(name: "Default Configuration",
                                          sessionRole: connectingSceneSession.role)
        config.delegateClass = SceneDelegate.self
        return config
    }
}

extension AppDelegate {

}
