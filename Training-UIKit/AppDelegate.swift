//
//  AppDelegate.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 07..
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private lazy var appController: AppController = {
        let appController = AppController(resolver: AppComposition.composeAssembler().resolver)
        return appController
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        appController.start(in: window, load: true)
        
        return true
    }
}


extension AppDelegate {

}
